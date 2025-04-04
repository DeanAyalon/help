import wixData from 'wix-data'

export function wixPay_onPaymentUpdate(event) {
    if (event.status === 'Successful') 
        wixData.insert('Registrations', {
            // Get program, name and birthdate from payment data
            program: '',
            name: '',
            birthdate: ''
        })
        // SuppressAuth may be necessary
}
