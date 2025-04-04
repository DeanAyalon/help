import wixLocationFrontend from 'wix-location-frontend';
import wixWindowFrontend from "wix-window-frontend";
import { myCreateOnlineOrderFunction } from "backend/checkout.web.js";
import wixPayFrontend from "wix-pay-frontend";

$w("#payNowButton").onClick(async () => {
  	try {
    	const order = await myCreateOnlineOrderFunction(planId);
    	const result = await wixPayFrontend.startPayment(order.wixPayOrderId);
    	if (result.status === "Successful") {
        
        if(wixLocationFrontend.url == "https://www.sportsclub.com/plans/baseball/registration"){

				// Collect data from the form fields
    			let name = $w("#athlete").value;
 			    let birthdate = $w("#athleteBirthdate").value;
   
                // Create an object to store the collected data
			    let formData = {
                "name": name,
                "birthdate": birthdate
                 };

         wixData.insert("BaseballRegistration", formData)
				.then(() => {
					console.log("Data stored successfully");
                    // Additional actions upon successful storage, like     
                    //showing a thank you message
					console.log("Successfully Ordered");
				})
				.catch((error) => {
					console.error("Error storing data", error);
                    // Error handling actions
				})
}//end of baseball if



if(wixLocationFrontend.url == "https://www.sportsclub.com/plans/track/registration"){

				// Collect data from the form fields
    			let name = $w("#athlete").value;
 			    let birthdate = $w("#athleteBirthdate").value;
   
                // Create an object to store the collected data
			    let formData = {
                "name": name,
                "birthdate": birthdate
                 };

         wixData.insert("TrackRegistration", formData)
				.then(() => {
					console.log("Data stored successfully");
                    // Additional actions upon successful storage, like     
                    //showing a thank you message
					console.log("Successfully Ordered");
				})
				.catch((error) => {
					console.error("Error storing data", error);
                    // Error handling actions
				})
}//end of track if statement