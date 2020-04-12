# Hakocalc

[![Build Status](https://travis-ci.org/masaniwasdp/Hakocalc.svg?branch=master)](https://travis-ci.org/masaniwasdp/Hakocalc)
[![codecov](https://codecov.io/gh/masaniwasdp/Hakocalc/branch/master/graph/badge.svg)](https://codecov.io/gh/masaniwasdp/Hakocalc)

Kalkulas probablon de sukcesi mortigi monstron.

## Priskribo

La ilo estas probablo kalkulilo kiun vi povas uzi kiam mortigi monstron, en la "Hakoniwa Insuloj".
Ĝi havas jenajn kalkulajn funkciojn.

+ La probablo sukcesi mortigi monstron kiam vi pafis PP misilojn.
+ La postulita kvanto da misiloj por mortigi monstron.

## Instali

``` bash
> git clone https://github.com/masaniwasdp/Hakocalc
> cd Hakocalc
> stack install
```

## Ekzekuto

``` bash
> hakocalc COMMAND ARGS
```

La jenaj estas validaj `COMMAND`.

+ `probability`
+ `quantity`

Se vi volas legi helpon, bonvolu ekzekti `hakocalc COMMAND --help`.

### Ekzemplo

``` bash
> hakocalc probability 3 38
92.324%
```

``` bash
> hakocalc quantity 3 97.5
48
> hakocalc quantity 3 100
Could not calculate.
```

## Permesilo

© 2019, masaniwa

La programaro estas licencita sub la [MIT](https://github.com/masaniwasdp/Hakocalc/blob/master/LICENSE).
