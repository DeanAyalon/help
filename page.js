import wixLocation from 'wix-location-frontend';
import { myCreateOnlineOrderFunction } from "backend/checkout.web.js";
import wixPayFrontend from "wix-pay-frontend";

function register(collectionName) {
    wixData.insert(collectionName, {
        name: $w("#athlete").value,
        birthdate: $w("#athleteBirthdate").value
    }).then(() => {
        console.log("Data stored successfully");
        // Additional actions upon successful storage, like     
        //showing a thank you message
        console.log("Successfully Ordered");
    })
    .catch((error) => {
        console.error("Error storing data", error);
        // Error handling actions
    })
}

$w("#payNowButton").onClick(async () => {
    try {
        const order = await myCreateOnlineOrderFunction(planId);
        const result = await wixPayFrontend.startPayment(order.wixPayOrderId);
        if (result.status === "Successful") {
            switch (wixLocation.path[1]) {
                case 'baseball': register('BaseballRegistration'); break
                case 'track': register('TrackRegistration'); break
                default: console.log('Unknown plan'); break
            }
        }
    } catch (e) { console.error(e) }
})