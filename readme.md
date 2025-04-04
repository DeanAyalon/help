[Source](https://forum.wixstudio.com/t/custom-code-review-alternative-to-nested-if-loop/70118)

# Problem
OP wants to optimize her code

## Optimization
1. Remove unused `wix-location-frontend` import
2. Use `wixLocation.path` instead of `wixLocation.url`
3. Use Switch/Case instead of chaining IF statements
4. Generalize a function for regitration (DRY)
- Additionally, removed variables instanciated with `let`
