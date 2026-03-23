document.addEventListener("DOMContentLoaded", function () {

    const buttons = document.querySelectorAll('.select-btn');
    const panel = document.getElementById('staySummary');

    const summaryRoom = document.getElementById('summaryRoom');
    const summaryPrice = document.getElementById('summaryPrice');
    const savedAmount = document.getElementById('savedAmount');

    const formRoom = document.getElementById('formRoom');
    const formPlan = document.getElementById('formPlan');
    const formPrice = document.getElementById('formPrice');

    const clearBtn = document.getElementById('clearBtn');

    buttons.forEach(btn => {

        btn.addEventListener('click', function () {

            let room = this.dataset.room;
            let plan = this.dataset.plan;
            let price = parseInt(this.dataset.price);
            let old = parseInt(this.dataset.old);

            let saved = old - price;

            // Show panel
            panel.classList.remove('d-none');

            // Fill UI
            summaryRoom.innerText = room + ' · ' + plan;
            summaryPrice.innerText = '₹' + price.toLocaleString();

            savedAmount.innerText = saved > 0 
                ? '₹' + saved.toLocaleString() + ' saved'
                : '';

            // Fill form
            formRoom.value = room;
            formPlan.value = plan;
            formPrice.value = price;
        });
    });

    // Clear button
    clearBtn.addEventListener('click', function () {
        panel.classList.add('d-none');
    });

});