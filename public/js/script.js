let guests = 1;
const maxGuests = 3;

function changeGuests(value) {
    guests += value;

    if (guests < 1) guests = 1;
    if (guests > maxGuests) guests = maxGuests;

    document.getElementById('guestCount').innerText = guests;

    // Update hidden input (IMPORTANT for form submit)
    document.getElementById('guestInput').value = guests;

    // UI disable effect
    document.getElementById('minusBtn').style.opacity = guests === 1 ? 0.5 : 1;
    document.getElementById('plusBtn').style.opacity = guests === maxGuests ? 0.5 : 1;
}

