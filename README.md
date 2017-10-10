Hakocalc
===

[![Build Status](https://travis-ci.org/masaniwasdp/Hakocalc.svg?branch=master)](https://travis-ci.org/masaniwasdp/Hakocalc)

![Hakocalc](https://masaniwasdp.github.io/Hakocalc/Screenshot.png)

Kalkulas probablon de sukcesi mortigi monstron.

## Priskribo
La ilo estas probablo kalkulilo kiun vi povas uzi kiam mortigi monstron, en la "Hakoniwa Insuloj".
Ĝi havas jenajn kalkulajn funkciojn.

+ La probablo sukcesi mortigi monstron kiam vi pafis PP misilojn.
+ La postulita kvanto da misiloj por mortigi monstron.
+ La transiro de probablo sukcesi mortigi monstron kiam vi pafis PP misilojn.

## Instali

``` bash
$ git clone https://github.com/masaniwasdp/Hakocalc.git
$ cd Hakocalc
$ stack install
```

## Ekzekuto

``` bash
$ hakocalc [command] [args...]
```

+ `command`: Subkomando kiun vi volas uzi.
+ `args`: Argumentoj kiuj estos transdonita al la subkomando.

### Ekzemplo

``` bash
$ hakocalc probability 3 38
92.324%
```

``` bash
$ hakocalc quantity 3 97.5
48
$ hakocalc quantity 3 100
Couldn't calculate.
```

``` bash
$ hakocalc transition 3 38 48
38:     92.324%
39:     93.121%
40:     93.841%
41:     94.491%
42:     95.077%
43:     95.604%
44:     96.078%
45:     96.503%
46:     96.885%
47:     97.227%
48:     97.533%
```

## Permesilo
© 2017, masaniwa

La programaro estas licencita sub la [MIT](https://github.com/masaniwasdp/Hakocalc/blob/master/LICENSE).
