(() => {
    const phoneInputs = document.querySelectorAll('input[type="tel"], [data-phone-mask]');

    const formatRussianPhone = (value) => {
        let digits = String(value || "").replace(/\D/g, "");

        if (digits.startsWith("8")) {
            digits = `7${digits.slice(1)}`;
        }

        if (digits !== "" && !digits.startsWith("7")) {
            digits = `7${digits}`;
        }

        digits = digits.slice(0, 11);
        const number = digits.startsWith("7") ? digits.slice(1) : digits;

        if (digits === "") {
            return "";
        }

        let formatted = "+7";
        if (number.length > 0) {
            formatted += ` (${number.slice(0, 3)}`;
        }
        if (number.length >= 3) {
            formatted += ")";
        }
        if (number.length > 3) {
            formatted += ` ${number.slice(3, 6)}`;
        }
        if (number.length > 6) {
            formatted += `-${number.slice(6, 8)}`;
        }
        if (number.length > 8) {
            formatted += `-${number.slice(8, 10)}`;
        }

        return formatted;
    };

    phoneInputs.forEach((input) => {
        input.setAttribute("inputmode", "tel");
        input.setAttribute("autocomplete", input.getAttribute("autocomplete") || "tel");
        input.setAttribute("maxlength", "18");
        input.setAttribute("placeholder", input.getAttribute("placeholder") || "+7 (___) ___-__-__");

        if (input.value) {
            input.value = formatRussianPhone(input.value);
        }

        input.addEventListener("focus", () => {
            if (!input.value) {
                input.value = "+7 (";
            }
        });

        input.addEventListener("input", () => {
            input.value = formatRussianPhone(input.value);
            input.setSelectionRange(input.value.length, input.value.length);
        });

        input.addEventListener("blur", () => {
            const digits = input.value.replace(/\D/g, "");
            if (digits.length <= 1) {
                input.value = "";
            }
        });
    });

    const getToastStack = () => {
        const shell = document.querySelector(".site-shell") || document.body;
        let stack = shell.querySelector(":scope > .toast-stack");

        if (!stack) {
            stack = document.createElement("div");
            stack.className = "toast-stack";
            stack.dataset.dynamic = "true";
            stack.setAttribute("aria-live", "polite");
            stack.setAttribute("aria-atomic", "true");
            shell.appendChild(stack);
        }

        return stack;
    };

    const showSystemToast = (message, type = "error") => {
        const stack = getToastStack();
        const notice = document.createElement("div");
        const content = document.createElement("span");

        notice.className = `alert ${type === "success" ? "alert-success" : "alert-error"}`;
        notice.setAttribute("role", type === "success" ? "status" : "alert");
        content.textContent = message || "Произошла ошибка. Попробуйте еще раз.";

        notice.appendChild(content);
        stack.appendChild(notice);

        window.setTimeout(() => {
            notice.remove();
            if (!stack.children.length && stack.dataset.dynamic === "true") {
                stack.remove();
            }
        }, 6500);
    };

    const getControlLabel = (control) => {
        const escapedId = control.id && window.CSS?.escape ? window.CSS.escape(control.id) : String(control.id || "").replace(/"/g, '\\"');
        const explicitLabel = escapedId ? document.querySelector(`label[for="${escapedId}"]`) : null;
        const fieldLabel = control.closest(".field")?.querySelector("label");
        const label = explicitLabel || fieldLabel;
        return (label?.textContent || control.placeholder || control.name || "поле").trim();
    };

    const getControlError = (control) => {
        const label = getControlLabel(control);

        if (control.type === "tel") {
            const digits = control.value.replace(/\D/g, "");
            if (control.required && digits.length === 0) {
                return `Заполните поле «${label}».`;
            }
            if (digits.length > 0 && digits.length !== 11) {
                return "Введите телефон полностью: +7 (999) 999-99-99.";
            }
        }

        if (control.validity.valueMissing) {
            return `Заполните поле «${label}».`;
        }

        if (control.validity.typeMismatch && control.type === "email") {
            return "Введите корректную эл. почту, например name@example.com.";
        }

        if (control.validity.tooShort) {
            return `Поле «${label}» слишком короткое.`;
        }

        if (control.validity.patternMismatch) {
            return `Проверьте формат поля «${label}».`;
        }

        return `Проверьте поле «${label}».`;
    };

    const setFieldError = (control, message) => {
        const field = control.closest(".field") || control.parentElement;
        if (!field) return;

        field.classList.add("is-invalid");
        control.setAttribute("aria-invalid", "true");
        control.setAttribute("title", message);
    };

    const clearFieldError = (control) => {
        const field = control.closest(".field") || control.parentElement;
        if (!field) return;

        field.classList.remove("is-invalid");
        control.removeAttribute("aria-invalid");
        control.removeAttribute("title");
    };

    document.querySelectorAll("form").forEach((form) => {
        if (form.dataset.nativeValidation === "true") return;

        form.setAttribute("novalidate", "novalidate");

        const controls = Array.from(form.querySelectorAll("input, textarea, select")).filter((control) => {
            const type = (control.getAttribute("type") || "").toLowerCase();
            return !control.disabled && !["hidden", "submit", "button", "reset"].includes(type);
        });

        controls.forEach((control) => {
            control.addEventListener("input", () => clearFieldError(control));
            control.addEventListener("change", () => clearFieldError(control));
        });

        form.addEventListener(
            "submit",
            (event) => {
                controls.forEach(clearFieldError);

                const invalidControl = controls.find((control) => {
                    if (control.type === "tel") {
                        const digits = control.value.replace(/\D/g, "");
                        return (control.required && digits.length === 0) || (digits.length > 0 && digits.length !== 11);
                    }

                    return !control.checkValidity();
                });

                if (!invalidControl) return;

                const message = getControlError(invalidControl);
                event.preventDefault();
                event.stopImmediatePropagation();
                setFieldError(invalidControl, message);
                showSystemToast(message);
                invalidControl.focus({ preventScroll: false });
            },
            true
        );
    });

    const drawer = document.querySelector("[data-cart-drawer]");
    const backdrop = document.querySelector("[data-cart-backdrop]");
    const openBtn = document.querySelector("[data-cart-toggle]");
    const closeBtn = document.querySelector("[data-cart-close]");
    const cartList = document.querySelector("[data-cart-list]");
    const cartClearUrl = cartList?.dataset.cartClearUrl || "";
    const cartCsrf = cartList?.dataset.cartCsrf || "";

    const openDrawer = () => {
        if (!drawer || !backdrop) return;
        drawer.classList.add("is-open");
        backdrop.classList.add("is-open");
    };

    const closeDrawer = () => {
        if (!drawer || !backdrop) return;
        drawer.classList.remove("is-open");
        backdrop.classList.remove("is-open");
    };

    const formatPrice = (value) =>
        Number(value || 0).toLocaleString("ru-RU", { maximumFractionDigits: 0 });

    const escapeHtml = (text) =>
        String(text ?? "")
            .replace(/&/g, "&amp;")
            .replace(/</g, "&lt;")
            .replace(/>/g, "&gt;")
            .replace(/"/g, "&quot;")
            .replace(/'/g, "&#39;");

    const renderCartList = (carts) => {
        if (!cartList) return;
        if (!Array.isArray(carts) || carts.length === 0) {
            cartList.innerHTML = '<p class="muted">Пока нет активных корзин.</p>';
            return;
        }

        cartList.innerHTML = carts
            .map(
                (cart) => `
                <article class="cart-mini-card">
                    <h4>${escapeHtml(cart.restaurant_name)}</h4>
                    <p>${Number(cart.items_count || 0)} поз. &bull; ${formatPrice(cart.subtotal)} &#8381;</p>
                    ${
                        Array.isArray(cart.items) && cart.items.length > 0
                            ? `<ul class="cart-mini-card__items">
                                ${cart.items
                                    .map(
                                        (item) => `<li>
                                            <span>${escapeHtml(item.name)}</span>
                                            <strong>&times;${Number(item.quantity || 0)}</strong>
                                        </li>`
                                    )
                                    .join("")}
                            </ul>`
                            : ""
                    }
                    <div class="cart-mini-card__actions">
                        <button class="btn btn-ghost" type="button" data-cart-clear data-cart-id="${Number(cart.id || 0)}">Удалить</button>
                        <a class="btn btn-primary" href="${escapeHtml(cart.details_url)}">Подробнее</a>
                    </div>
                </article>
            `
            )
            .join("");
    };

    const updateCartCounters = (count) => {
        if (typeof count !== "number") return;
        const badge = document.querySelector(".cart-btn .badge");
        if (badge) badge.textContent = String(count);

        const homeCart = document.querySelector(".home-cart-link");
        if (homeCart) {
            const baseLabel = (homeCart.textContent || "").replace(/\s*\(\d+\)\s*$/, "").trim();
            homeCart.textContent = count > 0 ? `${baseLabel} (${count})` : baseLabel;
        }
    };

    openBtn?.addEventListener("click", openDrawer);
    closeBtn?.addEventListener("click", closeDrawer);
    backdrop?.addEventListener("click", closeDrawer);

    document.querySelectorAll("[data-add-to-cart]").forEach((form) => {
        form.addEventListener("submit", async (event) => {
            event.preventDefault();
            const submit = form.querySelector('button[type="submit"]');
            if (submit) submit.disabled = true;

            try {
                const response = await fetch(form.action, {
                    method: "POST",
                    headers: { "X-Requested-With": "XMLHttpRequest" },
                    body: new FormData(form),
                });
                const data = await response.json();
                if (!data.ok) {
                    showSystemToast(data.message || "Ошибка добавления в корзину");
                    return;
                }

                updateCartCounters(data.cart_count);

                if (Array.isArray(data.carts)) {
                    renderCartList(data.carts);
                }

                openDrawer();
            } catch (e) {
                showSystemToast("Сеть недоступна. Повторите попытку.");
            } finally {
                if (submit) submit.disabled = false;
            }
        });
    });

    cartList?.addEventListener("click", async (event) => {
        const clearButton = event.target.closest("[data-cart-clear]");
        if (!clearButton) return;

        const cartId = Number.parseInt(clearButton.dataset.cartId || "0", 10);
        if (!cartClearUrl || !cartCsrf || cartId <= 0) return;

        clearButton.disabled = true;
        try {
            const response = await fetch(cartClearUrl, {
                method: "POST",
                headers: { "Content-Type": "application/x-www-form-urlencoded" },
                body: `_csrf=${encodeURIComponent(cartCsrf)}&cart_id=${encodeURIComponent(String(cartId))}`,
            });
            const data = await response.json();
            if (!data.ok) {
                showSystemToast(data.message || "Не удалось очистить корзину.");
                return;
            }

            updateCartCounters(data.cart_count);
            renderCartList(data.carts);
            openDrawer();
        } catch (e) {
            showSystemToast("Сеть недоступна. Повторите попытку.");
        } finally {
            clearButton.disabled = false;
        }
    });

    document.querySelectorAll("[data-qty-control]").forEach((control) => {
        const input = control.querySelector("[data-qty-input]");
        const decButton = control.querySelector("[data-qty-dec]");
        const incButton = control.querySelector("[data-qty-inc]");
        const form = control.closest("form");
        const shouldSubmit = Boolean(form?.hasAttribute("data-qty-submit"));
        if (!input || !decButton || !incButton) return;

        const normalizeValue = () => {
            const parsed = Number.parseInt(input.value || "1", 10);
            return Number.isFinite(parsed) && parsed > 0 ? parsed : 1;
        };

        const updateValue = (delta) => {
            const next = Math.max(1, normalizeValue() + delta);
            if (next === normalizeValue()) return;
            input.value = String(next);
            if (shouldSubmit && form) {
                form.requestSubmit();
            }
        };

        decButton.addEventListener("click", () => {
            updateValue(-1);
        });

        incButton.addEventListener("click", () => {
            updateValue(1);
        });
    });

    document.querySelectorAll("[data-favorite-toggle]").forEach((button) => {
        button.addEventListener("click", async () => {
            const restaurantId = button.dataset.restaurantId;
            if (!restaurantId) return;
            try {
                const response = await fetch(button.dataset.url || "", {
                    method: "POST",
                    headers: { "Content-Type": "application/x-www-form-urlencoded" },
                    body: `_csrf=${encodeURIComponent(button.dataset.csrf || "")}&restaurant_id=${encodeURIComponent(restaurantId)}`,
                });
                const data = await response.json();
                if (!data.ok) {
                    showSystemToast(data.message || "Не удалось обновить избранное");
                    return;
                }
                if (button.hasAttribute("data-remove-favorite-card") && data.favorite === false) {
                    const card = button.closest("[data-favorite-card]");
                    const grid = document.querySelector("[data-favorites-grid]");
                    const emptyState = document.querySelector("[data-favorites-empty]");

                    if (card) {
                        card.classList.add("is-removing");
                        setTimeout(() => {
                            card.remove();
                            if (grid && !grid.querySelector("[data-favorite-card]")) {
                                grid.remove();
                                if (emptyState) {
                                    emptyState.hidden = false;
                                }
                            }
                        }, 220);
                    }
                    return;
                }

                const favoriteLabel = button.dataset.favoriteLabel || "★ В избранном";
                const unfavoriteLabel = button.dataset.unfavoriteLabel || "☆ В избранное";
                button.textContent = data.favorite ? favoriteLabel : unfavoriteLabel;
            } catch (e) {
                showSystemToast("Ошибка запроса");
            }
        });
    });

    document.querySelectorAll("[data-address-input]").forEach((addressInput) => {
        const field = addressInput.closest(".field");
        const panel = field?.querySelector("[data-address-suggest-panel]");
        if (!panel) return;

        let addressTimer = null;
        let abortController = null;

        const closePanel = () => {
            panel.hidden = true;
            panel.innerHTML = "";
        };

        const renderPanel = (items, query) => {
            panel.innerHTML = "";

            if (!Array.isArray(items) || items.length === 0) {
                const empty = document.createElement("div");
                empty.className = "address-suggest__empty";
                empty.textContent = `Адресов по запросу «${query}» не найдено`;
                panel.appendChild(empty);
                panel.hidden = false;
                return;
            }

            items.slice(0, 8).forEach((item) => {
                const option = document.createElement("button");
                option.type = "button";
                option.className = "address-suggest__option";
                option.innerHTML = `
                    <strong>${escapeHtml(item.label || "")}</strong>
                    <span>Нажмите, чтобы выбрать адрес доставки</span>
                `;
                option.addEventListener("mousedown", (event) => {
                    event.preventDefault();
                    addressInput.value = item.label || "";
                    clearFieldError(addressInput);
                    closePanel();
                });
                panel.appendChild(option);
            });

            panel.hidden = false;
        };

        addressInput.addEventListener("input", () => {
            const q = addressInput.value.trim();
            if (q.length < 2) {
                closePanel();
                return;
            }

            clearTimeout(addressTimer);
            addressTimer = setTimeout(async () => {
                try {
                    abortController?.abort();
                    abortController = new AbortController();

                    panel.hidden = false;
                    panel.innerHTML = '<div class="address-suggest__empty">Ищем адрес...</div>';

                    const res = await fetch(`${addressInput.dataset.suggestUrl}?q=${encodeURIComponent(q)}`, {
                        signal: abortController.signal,
                    });
                    const data = await res.json();
                    renderPanel(data.items, q);
                } catch (e) {
                    if (e.name !== "AbortError") {
                        closePanel();
                    }
                }
            }, 320);
        });

        addressInput.addEventListener("focus", () => {
            if (addressInput.value.trim().length >= 2) {
                addressInput.dispatchEvent(new Event("input"));
            }
        });

        addressInput.addEventListener("keydown", (event) => {
            if (event.key === "Escape") {
                closePanel();
            }
        });

        document.addEventListener("mousedown", (event) => {
            if (!field.contains(event.target)) {
                closePanel();
            }
        });
    });

    document.querySelectorAll("[data-image-upload]").forEach((upload) => {
        const input = upload.querySelector("[data-image-upload-input]");
        const preview = upload.querySelector("[data-image-upload-preview]");

        if (!input || !preview) {
            return;
        }

        input.addEventListener("change", () => {
            const file = input.files?.[0];

            if (!file || !file.type.startsWith("image/")) {
                return;
            }

            preview.src = URL.createObjectURL(file);
        });
    });

    document.querySelectorAll("[data-admin-autosubmit]").forEach((select) => {
        const form = select.closest("form");

        if (!form) {
            return;
        }

        select.addEventListener("change", () => {
            form.requestSubmit();
        });
    });

    document.querySelectorAll(".page-admin-brutal select").forEach((select) => {
        if (select.dataset.enhancedSelect === "true") {
            return;
        }

        const wrapper = document.createElement("div");
        const toggle = document.createElement("button");
        const label = document.createElement("span");
        const chevron = document.createElement("span");
        const menu = document.createElement("div");
        const options = Array.from(select.options);
        const optionPairs = [];

        if (options.length === 0) {
            return;
        }

        select.dataset.enhancedSelect = "true";
        select.classList.add("admin-native-select");

        wrapper.className = "custom-dropdown admin-custom-dropdown";
        toggle.className = "custom-dropdown__toggle";
        toggle.type = "button";
        toggle.setAttribute("aria-haspopup", "listbox");
        toggle.setAttribute("aria-expanded", "false");
        label.dataset.customDropdownLabel = "";
        chevron.className = "custom-dropdown__chevron";
        chevron.setAttribute("aria-hidden", "true");
        menu.className = "custom-dropdown__menu custom-dropdown__menu--floating";
        menu.setAttribute("role", "listbox");

        const positionMenu = () => {
            const rect = toggle.getBoundingClientRect();
            const gap = 8;
            const viewportPadding = 12;
            const menuHeight = Math.min(menu.scrollHeight || 260, 260);
            const availableBelow = window.innerHeight - rect.bottom;
            const shouldOpenUp = availableBelow < menuHeight + gap && rect.top > availableBelow;
            const top = shouldOpenUp
                ? Math.max(viewportPadding, rect.top - menuHeight - gap)
                : Math.min(window.innerHeight - viewportPadding, rect.bottom + gap);
            const left = Math.min(
                Math.max(viewportPadding, rect.left),
                Math.max(viewportPadding, window.innerWidth - rect.width - viewportPadding)
            );

            menu.style.width = `${rect.width}px`;
            menu.style.left = `${left}px`;
            menu.style.top = `${top}px`;
        };

        const closeMenu = () => {
            wrapper.classList.remove("is-open");
            menu.classList.remove("is-open");
            toggle.setAttribute("aria-expanded", "false");
        };

        const openMenu = () => {
            document.querySelectorAll(".admin-custom-dropdown.is-open").forEach((dropdown) => {
                if (dropdown !== wrapper) {
                    dropdown.classList.remove("is-open");
                }
            });
            document.querySelectorAll(".custom-dropdown__menu--floating.is-open").forEach((dropdownMenu) => {
                if (dropdownMenu !== menu) {
                    dropdownMenu.classList.remove("is-open");
                }
            });
            positionMenu();
            wrapper.classList.add("is-open");
            menu.classList.add("is-open");
            toggle.setAttribute("aria-expanded", "true");
        };

        const refreshLabel = () => {
            const selected = select.selectedOptions[0] || options[0];
            label.textContent = selected?.textContent?.trim() || "Выберите";
        };

        const syncOptions = () => {
            optionPairs.forEach(({ nativeOption, option }) => {
                const isHidden = nativeOption.hidden || nativeOption.disabled;
                const active = select.value === nativeOption.value;

                option.hidden = isHidden;
                option.disabled = isHidden;
                option.style.display = isHidden ? "none" : "";
                option.classList.toggle("is-hidden", isHidden);
                option.classList.toggle("is-active", active);
                option.setAttribute("aria-selected", active ? "true" : "false");
            });

            refreshLabel();
        };

        options.forEach((nativeOption) => {
            const option = document.createElement("button");
            option.className = "custom-dropdown__option";
            option.type = "button";
            option.setAttribute("role", "option");
            option.dataset.value = nativeOption.value;
            option.textContent = nativeOption.textContent;

            option.addEventListener("click", () => {
                if (nativeOption.hidden || nativeOption.disabled) {
                    return;
                }

                select.value = nativeOption.value;
                select.dispatchEvent(new Event("change", { bubbles: true }));
                syncOptions();
                closeMenu();
            });

            optionPairs.push({ nativeOption, option });
            menu.appendChild(option);
        });

        syncOptions();
        toggle.append(label, chevron);
        wrapper.append(toggle);
        select.insertAdjacentElement("afterend", wrapper);
        document.body.appendChild(menu);

        select.addEventListener("change", () => {
            syncOptions();
        });

        select.updateCustomDropdown = syncOptions;

        toggle.addEventListener("click", (event) => {
            event.preventDefault();
            wrapper.classList.contains("is-open") ? closeMenu() : openMenu();
        });

        document.addEventListener("click", (event) => {
            if (!wrapper.contains(event.target) && !menu.contains(event.target)) {
                closeMenu();
            }
        });

        document.addEventListener("keydown", (event) => {
            if (event.key === "Escape") {
                closeMenu();
            }
        });

        window.addEventListener("scroll", () => {
            if (wrapper.classList.contains("is-open")) {
                positionMenu();
            }
        }, true);

        window.addEventListener("resize", () => {
            if (wrapper.classList.contains("is-open")) {
                positionMenu();
            }
        });
    });

    document.querySelectorAll("[data-admin-menu-item-form]").forEach((form) => {
        const restaurantSelect = form.querySelector("[data-menu-item-restaurant]");
        const categorySelect = form.querySelector("[data-menu-item-category]");

        if (!restaurantSelect || !categorySelect) {
            return;
        }

        const filterCategories = () => {
            const restaurantId = restaurantSelect.value;
            const selectedOption = categorySelect.selectedOptions[0];

            Array.from(categorySelect.options).forEach((option) => {
                const isPlaceholder = option.value === "";
                const belongsToRestaurant = option.dataset.restaurantId === restaurantId;
                const isVisible = isPlaceholder || (restaurantId !== "" && belongsToRestaurant);

                option.hidden = !isVisible;
                option.disabled = !isVisible;
            });

            if (selectedOption && (selectedOption.hidden || selectedOption.disabled)) {
                categorySelect.value = "";
            }

            categorySelect.dispatchEvent(new Event("change", { bubbles: true }));
            categorySelect.updateCustomDropdown?.();
        };

        restaurantSelect.addEventListener("change", filterCategories);
        filterCategories();
    });

    document.querySelectorAll("[data-custom-dropdown]").forEach((dropdown) => {
        const hiddenInput = dropdown.querySelector("[data-custom-dropdown-input]");
        const toggle = dropdown.querySelector("[data-custom-dropdown-toggle]");
        const label = dropdown.querySelector("[data-custom-dropdown-label]");
        const menu = dropdown.querySelector("[data-custom-dropdown-menu]");
        const options = Array.from(dropdown.querySelectorAll("[data-custom-dropdown-option]"));

        if (!hiddenInput || !toggle || !label || !menu || options.length === 0) {
            return;
        }

        const closeMenu = () => {
            dropdown.classList.remove("is-open");
            toggle.setAttribute("aria-expanded", "false");
        };

        const openMenu = () => {
            dropdown.classList.add("is-open");
            toggle.setAttribute("aria-expanded", "true");
        };

        const setValue = (value, textLabel) => {
            hiddenInput.value = value;
            label.textContent = textLabel;

            options.forEach((option) => {
                const isActive = option.dataset.value === value;
                option.classList.toggle("is-active", isActive);
                option.setAttribute("aria-selected", isActive ? "true" : "false");
            });
        };

        toggle.addEventListener("click", (event) => {
            event.preventDefault();
            if (dropdown.classList.contains("is-open")) {
                closeMenu();
            } else {
                openMenu();
            }
        });

        options.forEach((option) => {
            option.addEventListener("click", () => {
                const value = option.dataset.value || "";
                const textLabel = option.dataset.label || option.textContent?.trim() || "";
                if (!value || !textLabel) return;
                setValue(value, textLabel);
                closeMenu();
            });
        });

        document.addEventListener("click", (event) => {
            if (!dropdown.contains(event.target)) {
                closeMenu();
            }
        });

        document.addEventListener("keydown", (event) => {
            if (event.key === "Escape") {
                closeMenu();
            }
        });
    });

    document.querySelectorAll("[data-sort-dropdown]").forEach((dropdown) => {
        const form = dropdown.closest("form");
        const hiddenInput = dropdown.querySelector("[data-sort-input]");
        const toggle = dropdown.querySelector("[data-sort-toggle]");
        const current = dropdown.querySelector("[data-sort-current]");
        const menu = dropdown.querySelector("[data-sort-menu]");
        const options = Array.from(dropdown.querySelectorAll("[data-sort-option]"));

        if (!form || !hiddenInput || !toggle || !menu || options.length === 0) {
            return;
        }

        const closeMenu = () => {
            dropdown.classList.remove("is-open");
            toggle.setAttribute("aria-expanded", "false");
        };

        const openMenu = () => {
            dropdown.classList.add("is-open");
            toggle.setAttribute("aria-expanded", "true");
        };

        toggle.addEventListener("click", (event) => {
            event.preventDefault();
            if (dropdown.classList.contains("is-open")) {
                closeMenu();
            } else {
                openMenu();
            }
        });

        options.forEach((option) => {
            option.addEventListener("click", () => {
                const value = option.dataset.value || "";
                const label = option.dataset.label || option.textContent?.trim() || "";
                if (!value) return;

                hiddenInput.value = value;
                if (current && label) {
                    current.textContent = label;
                }

                options.forEach((node) => {
                    const active = node === option;
                    node.classList.toggle("is-active", active);
                    node.setAttribute("aria-selected", active ? "true" : "false");
                });

                closeMenu();
                form.submit();
            });
        });

        document.addEventListener("click", (event) => {
            if (!dropdown.contains(event.target)) {
                closeMenu();
            }
        });

        document.addEventListener("keydown", (event) => {
            if (event.key === "Escape") {
                closeMenu();
            }
        });
    });

    document.querySelectorAll("[data-order-tracker]").forEach((tracker) => {
        const statusUrl = tracker.dataset.statusUrl || "";
        const title = tracker.querySelector("[data-order-status-title]");
        const badge = tracker.querySelector("[data-order-status-badge]");
        const fill = tracker.querySelector("[data-order-progress-fill]");
        const runner = tracker.querySelector("[data-order-progress-runner]");
        const hint = tracker.querySelector("[data-order-status-hint]");
        const pageStatusLabel = document.querySelector("[data-order-status-label]");
        const steps = Array.from(tracker.querySelectorAll("[data-order-step]"));

        if (!statusUrl || !title || !badge || !fill || !runner || steps.length === 0) {
            return;
        }

        const applyStatus = (data) => {
            if (!data || !data.ok) return;

            const label = data.label || data.status || "";
            const percent = Number(data.percent || 0);
            title.textContent = label;
            badge.textContent = label;
            if (pageStatusLabel) pageStatusLabel.textContent = label;

            fill.style.width = `${percent}%`;
            runner.style.left = `${percent}%`;

            steps.forEach((step, index) => {
                const isDone = index <= Number(data.current_index || 0);
                const isCurrent = step.dataset.orderStep === data.status;
                step.classList.toggle("is-done", isDone);
                step.classList.toggle("is-current", isCurrent);
            });

            if (hint && data.status === "delivered") {
                hint.textContent = "Заказ доставлен. Спасибо, что выбрали Mealgo.";
            }
        };

        const refreshStatus = async () => {
            try {
                const response = await fetch(statusUrl, {
                    headers: { "X-Requested-With": "XMLHttpRequest" },
                });
                const data = await response.json();
                applyStatus(data);
            } catch (e) {
                // The current page state is still valid if the refresh request fails.
            }
        };

        window.setTimeout(refreshStatus, 3000);
        window.setInterval(refreshStatus, 60000);
    });
})();
