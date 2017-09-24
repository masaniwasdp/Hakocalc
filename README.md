HakoniwaKilling
===

![HakoniwaKilling](https://masaniwasdp.github.io/HakoniwaKilling/Screenshot.png)

Kalkulas probablon de sukcesi mortigi monstron, en la "Hakoniwa Insulo".

## Priskribo
La ilo estas probablo kalkulilo kiun vi povas uzi kiam mortigi monstron, en la "Hakoniwa Insulo".
Ĝi havas funkciojn kiaj la jenaj.

+ Kalkuli la probablon de sukcesi mortigi monstron kiam vi ĵetis PP misilojn kiom la specifaj kvantoj.
+ Kalkuli la postulitan kvanton da misiloj por mortigi monstron en la specifa probablo.
+ Kalkuli transiron de probablo de sukcesi mortigi monstron kiam vi ĵetis PP misilojn,
  kiom la kvantoj de specifaj gamoj.

## Instali

``` bash
$ stack install
```

## Ekzekuto

``` bash
$ hakoniwakilling [command] [args...]
```

+ `command`: Subkomando kiu vi volas uzi.
+ `args`: Argumentoj kiuj estos transdonita al la subkomando.

### Subkomando "probability"

`hakoniwakilling probability [args...]`

Kalkulas la probablon de sukcesi mortigi monstron kiam vi ĵetis PP misilojn kiom la specifaj kvantoj.

+ `-h Integer --hp=Integer`: HP de monstro.
+ `-q Integer --quantity=Integer`: Kvanto da misiloj kiu estos lanĉita.

### Subkomando "quantity"

`hakoniwakilling quantity [args...]`

Kalkulas la postulitan kvanton da misiloj por mortigi monstron en la specifa probablo.

+ `-h Integer --hp=Integer`: HP de monstro.
+ `-p Double(%) --probability=Double(%)`: Probablo de sukcesi mortigi monstron.

### Subkomando "transition"

`hakoniwakilling transition [args...]`

Kalkuli transiron de probablo de sukcesi mortigi monstron kiam vi ĵetis PP misilojn, kiom la kvantoj de specifaj gamoj.

+ `-h Integer --hp=Integer`: HP de monstro.
+ `-n Integer --min=Integer`: Minimuma kvanto da misiloj kiu estos lanĉita.
+ `-m Integer --max=Integer`: Maksimuma kvanto da misiloj kiu estos lanĉita.

## Permesiloj
+ [MIT](https://github.com/masaniwasdp/HakoniwaKilling/blob/master/LICENSE)

## Aŭtoroj
+ masaniwa
