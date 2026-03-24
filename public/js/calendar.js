document.addEventListener("DOMContentLoaded", function () {

    const checkin = document.getElementById("check_in");
    const checkout = document.getElementById("check_out");

    if (!checkin || !checkout) return;

    const maxDate = checkin.dataset.max;
    const checkInDefault = checkin.dataset.default;
    const checkOutDefault = checkout.dataset.default;

    const checkInDate = new Date(checkInDefault);
    const minCheckoutDate = new Date(checkInDate.getTime());
    minCheckoutDate.setDate(minCheckoutDate.getDate() + 1);

    // CHECKOUT picker
    const checkoutPicker = flatpickr(checkout, {
        dateFormat: "Y-m-d",
        minDate: minCheckoutDate,
        maxDate: maxDate, 
        defaultDate: checkOutDefault
    });

    // CHECKIN picker
    flatpickr(checkin, {
        dateFormat: "Y-m-d",
        minDate: "today",
        maxDate: maxDate, 
        defaultDate: checkInDefault,

        onChange: function (selectedDates) {

            if (selectedDates.length > 0) {

                let nextDay = new Date(selectedDates[0]);
                nextDay.setDate(nextDay.getDate() + 1);

                // update checkout min + max
                checkoutPicker.set("minDate", nextDay);
                checkoutPicker.set("maxDate", maxDate);

                // clear invalid checkout
                if (checkout.value) {
                    let selectedOut = new Date(checkout.value);
                    if (selectedOut <= selectedDates[0]) {
                        checkoutPicker.clear();
                    }
                }

                // auto open checkout
                setTimeout(() => checkoutPicker.open(), 100);
            }
        }
    });

});