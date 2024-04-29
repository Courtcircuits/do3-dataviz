# How to install Rmarkdown ?
1. Install r core
```bash
sudo apt-get install r-base-core
sudo apt-get install pandoc
```
2. Install Rmarkdown
```bash
sudo Rscript -e "install.packages('rmarkdown')"
```
3. Compile an Rmarkdown file
```bash
Rscript -e "rmarkdown::render('file.Rmd')"
```
