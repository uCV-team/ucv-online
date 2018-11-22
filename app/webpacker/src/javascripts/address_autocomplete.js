import { throttle } from "lodash";

let token;
let inputField, resultsField;

function initAutocomplete(modalId, api_token) {
    token = api_token;
    inputField = $(`#${modalId}_address`);
    resultsField = $(`#${modalId}_results`);

    autocomplete();
}

function autocomplete() {
    // Instead of sending a request on each keystroke, send one every second. (LocationIQ free limit: 2 req/s)
    let throttled = throttle(fetchData, 1000);
    inputField.on('keyup', throttled);
}

async function fetchData() {
    let data;
    let query = encodeURIComponent(inputField.val());
    let api_link = `https://api.locationiq.com/v1/autocomplete.php?key=${token}&q=${query}&limit=5`;

    if (inputField.val().length > 0) {
        try {
            let response = await fetch(api_link);
            data = await response.json();
        } catch(e) {
            $('.modal.fade.show').find('.alert.alert-danger').empty().append(e.message)
        }
    }

    displayResults(data);
}

function displayResults(data) {
    let formattedAddresses;

    if (inputField.val().length > 0) {
        resultsField.show();
    } else {
        resultsField.find('ul').empty();
        resultsField.hide();
    }

    if (data && Array.isArray(data) && data.length > 0) {
        formattedAddresses = data.map(address => address.display_name);
        resultsField.find('ul').empty();
        formattedAddresses.forEach(address => {
            resultsField.find('ul').append(`<li>${address}</li>`);
        });
    }

}

window.initAutocomplete = initAutocomplete;
