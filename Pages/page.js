import { myCreateOnlineOrderFunction } from "backend/checkout.web.js";
import wixPayFrontend from "wix-pay-frontend";

$w("#payNowButton").onClick(async () => {
    try {
        /* Payment data should include program, name and birthdate
            program:    wixLocation.query[1]
            name:       $w('#athlete').value
            birthdate:  $w('#athleteBirthdate').value   */
        const order = await myCreateOnlineOrderFunction(planId);
        wixPayFrontend.startPayment(order.wixPayOrderId)
    } catch (e) { console.error(e) }
})