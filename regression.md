# regression

## linear regression

Predicts infinite, continuous numbers (regression model).

Is "supervised" because the model is trained on labeled data.

## classification model

Predicts finite, discrete categories.

## terminology

term | definition
--- | ---
training set | data used to train the model
`x` | feature, input variable
`y` | output/target variable
`m` | number of training examples
`(x,y)` | one training example
`(x^(i),y^(i))` | `i`th training example

---

```mermaid
graph TD
    t[training set] --> a[learning algo]
    a --> m[model]
    x[feature x] --> m --> y[estimated output y]
```
