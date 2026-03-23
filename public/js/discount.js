document.addEventListener("DOMContentLoaded", function () {

    document.querySelectorAll(".discount-card").forEach(card => {

        const editBtn = card.querySelector(".edit-btn");
        const viewMode = card.querySelector(".view-mode");
        const editMode = card.querySelector(".edit-mode");

        editBtn.addEventListener("click", function () {
            viewMode.classList.add("d-none");
            editMode.classList.remove("d-none");
        });

    });

});