# Context relevant self organizing map (for matlab)
Context relevant self organizing map (CRSOM) is an artificial neural network proposed by Pitoyo Hartono. CRSOM consists of three layers, where the neurons in hidden layer are aligned in a 2D grid like in well-known SOM. Mathematical definition, properties and empirical experiments can be found in original [paper](http://www.ncbi.nlm.nih.gov/pubmed/25546864).

![CRSOM structure](http://s16.postimg.org/ioypo0hs5/Screen_Shot_2016_04_08_at_12_22_26.png)


## How to start
* `git clone git@github.com:liskape/crsom.git --branch master --depth 1`
* add to path in IDE (selected folders and subfolders)


## Example usage
```
metacentrum_run_batched('db_ep_acdc', 0.1, 2000, 4, 1)
```
Where db_ep_acdc is sample dataset consisting of songs of David Bowie, Elvis Presley and AC/DC. Each song is represented by *timbre* features from [The Echo Nest API](http://developer.echonest.com/docs/v4). 90 features are result of covariance matrix and mean over all 12-dim timbre vectors from segments provided by EchoNestAnalyzer. You can find more datasets in `/dataset` folder. Other parameters are: learning rate, number of epochs, type of normalization and relative size of hidden layer to number of input vector.

Originally `metacentrum_run_batched` was used to run computations on remote clusters. You can easily setup framework for your remote clusters with git repo -- take a look at `param_space_sampling.sh`. Another way to work with CRSOM is directly call `create_crsom`, you can find inspiration in `train_problem.m`.

After training is finished, results are stored in `/results` folder. You can load `.mat` file to your workspace and investigate trained net further.

**or** load already computed result:
```
load('results/db_ep_acdc_ep=2000_norm=4_size=1.00_LR2=0.10_.mat')
```

### selforgmap plots
With `.mat` loaded in your workspace you can treat it the same way as result of matlab's trained `selforgmap` e.g. call plotting functions (`plotsompos`, `plotsomhits`, `plotsomnd`).


```
plotsompos(crsom, in)
```

![plotsompos](http://s32.postimg.org/6to4xnc1x/pos.png)

```
plotsomhits(crsom, in)
```

![plotsomhits](http://s32.postimg.org/eukclq5l1/hits.png)

```
plotsomnd(crsom)
```
![plotsomnd](http://s32.postimg.org/li3633kxx/somnd.png)


### semantic plots
```
plot_crsom_summary(crsom, us,uc, in, ta)
```
![plot_crsom_summary](http://s32.postimg.org/yqfdazc91/summ.png)
```
animate_map_formation( crsom, in, ta )
```
![animate_map_formation](http://s32.postimg.org/o9gf6b2rp/ani.png)

```
my_plot_som_no_confl(us, in, ta)
```
![my_plot_som_no_confl](http://s32.postimg.org/wp0h7bidh/bbb.png)


```
my_plot_som_no_confl(crsom, in, ta)
```
![my_plot_som_no_confl](http://s32.postimg.org/4k1clh5fp/aaa.png)

```
plot_crsom_crosses(crsom, in, ta)
```
![plot_crsom_crosses](http://s32.postimg.org/j70gxn8at/semmap.png)





### debug plots

```
plot_crsom_attrs(crsom)
```
![plot_crsom_attrs](http://s32.postimg.org/rfdh35n7p/atts.png)

```
plot_citizenship( crsom )
```
![plot_citizenship](http://s32.postimg.org/bmmarx4g5/citi.png)

## Licence
Context-relevant self organizing map implemented in Matlab

Copyright (C) 2016  Petr Liška

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <http://www.gnu.org/licenses/>.



