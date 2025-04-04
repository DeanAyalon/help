[Source](https://forum.wixstudio.com/t/custom-code-review-alternative-to-nested-if-loop/70118)

# Problem
OP wants to optimize her code
On a further inspection - The code is **insecure**, regardless of optimization

## Security
As it stands, the CMS allows anyone to CRUD records - This should be disabled and performed by the backend, utilizing the [paymentUpdate]() event
- Further implementation necessary to transfer the program, name and birthdate to payment data for the backend to identify

## Optimization
1. Remove unused `wix-location-frontend` import
2. Use `wixLocation.path` instead of `wixLocation.url`
3. Merge CMS collections into a single one ('Registrations')
