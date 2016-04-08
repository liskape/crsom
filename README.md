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

Where am_kp_acdc is sample dataset consisting of songs of David Bowie, Elvis Presley and AC/DC. Each song is represented by *timbre* features from [The Echo Nest API](http://developer.echonest.com/docs/v4). 90 features are result of covariance matrix and mean over all 12-dim timbre vectors from segments provided by EchoNestAnalyzer. You can find more datasets in `/dataset` folder. Other parameters are: learning rate, number of epochs, type of normalization and relative size of hidden layer to number of input vector.

Originally `metacentrum_run_batched` was used to run computations on remote clusters. You can easily setup framework for your remote clusters with git repo -- take a look at `param_space_sampling.sh`. Another way to work with CRSOM is directly call `create_crsom`, you can find inspiration in `train_problem.m`.

After training is finished, results are stored in `/results` folder. You can load `.mat` file to your workspace and investigate trained net further.


### selforgmap plots
With `.mat` loaded in your workspace you can treat it the same way as result of matlab's trained `selforgmap` e.g. call plotting functions (`plotsompos`, `plotsomhits`, `plotsomnd`).


```
plotsompos(crsom, in)
```

![plotsompos](http://s22.postimg.org/er1c48d6p/Screen_Shot_2016_04_08_at_14_00_43.png)

```
plotsomhits(crsom, in)
```

![plotsomhits](http://s16.postimg.org/o2cvb9ds5/Screen_Shot_2016_04_08_at_14_00_21.png)

```
plotsomnd(crsom)
```
![plotsomnd](http://s16.postimg.org/o6bqompl1/Screen_Shot_2016_04_08_at_13_59_38.png)


### semantic plots
```
plot_crsom_summary(crsom, us,uc, in, ta)
```
![plot_crsom_summary](http://s21.postimg.org/arvt9a0c7/Screen_Shot_2016_04_08_at_14_17_58.png)
```
animate_map_formation2( crsom, in, ta )
```
![animate_map_formation2](http://s9.postimg.org/g1c2ewm5b/Screen_Shot_2016_04_08_at_14_12_25.png)

```
my_plot_som_no_confl(us, in, ta)
```
![my_plot_som_no_confl](http://s30.postimg.org/6wijryesh/Screen_Shot_2016_04_08_at_14_09_37.png)


```
my_plot_som_no_confl(crsom, in, ta)
```
![my_plot_som_no_confl](http://s27.postimg.org/q1oz5x1tv/Screen_Shot_2016_04_08_at_14_06_31.png)


### debug plots

```
plot_crsom_attrs(crsom)
```
![plot_crsom_attrs](http://s21.postimg.org/mrgyrg1mf/Screen_Shot_2016_04_08_at_14_20_13.png)

```
animate_citizenship_formation(crsom)
```
![animate_citizenship_formation](http://s22.postimg.org/c51126hfl/Screen_Shot_2016_04_08_at_16_57_54.png)





## Contribute

## Licence

## References


