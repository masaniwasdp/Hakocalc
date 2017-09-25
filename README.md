HakoniwaKilling
===

![HakoniwaKilling](https://masaniwasdp.github.io/HakoniwaKilling/Screenshot.png)

Kalkulas probablon de sukcesi mortigi monstron.

## Priskribo
La ilo estas probablo kalkulilo kiun vi povas uzi kiam mortigi monstron, en la "Hakoniwa Insuloj".
Ĝi havas jenajn kalkulajn funkciojn.

+ La probablo sukcesi mortigi monstron kiam vi pafis PP misilojn.
+ La postulita kvanto da misiloj por mortigi monstron.
+ La transiro de probablo sukcesi mortigi monstron kiam vi pafis PP misilojn.

## Instali

``` bash
$ git clone https://github.com/masaniwasdp/HakoniwaKilling.git
$ cd HakoniwaKilling
$ stack install
```

## Ekzekuto

``` bash
$ hakoniwakilling [command] [args...]
```

+ `command`: Subkomando kiun vi volas uzi.
+ `args`: Argumentoj kiuj estos transdonita al la subkomando.

### Ekzemplo

``` bash
$ hakoniwakilling probability --hp 3 --quantity 38
92.324%
```

``` bash
$ hakoniwakilling quantity --hp 3 --probability 97.5
48
```

``` bash
$ hakoniwakilling transition --hp 3 --min 38 --max 48
92.324%
93.121%
93.841%
94.491%
95.077%
95.604%
96.078%
96.503%
96.885%
97.227%
97.533%
```

## Permesilo
© 2017, masaniwa

La programaro estas licencita sub la [MIT](https://github.com/masaniwasdp/HakoniwaKilling/blob/master/LICENSE).
