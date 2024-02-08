# ==============================================================================
# Author(s) : Heini M. Natri, hnatri@tgen.org
# Date: 12/14/2023
# Description: Colors and themes for the lung spatial ASE plots
# ==============================================================================

# ======================================
# Import libraries
# ======================================

suppressPackageStartupMessages({library(tidyverse)
                                library(googlesheets4)
                                library(ggthemes)
                                library(dplyr)
                                library(ggplot2)
                                library(ggrepel)
                                library(viridis)})

# ======================================
# Cell type markers
# ======================================


# ======================================
# ggplot themes
# ======================================

my_theme <- theme(axis.text = element_text(size = 9),
                  axis.title = element_text(size = 9),
                  plot.title = element_text(size = 10))

manuscript_theme <- theme(axis.text = element_text(size = 6),
                          axis.title = element_text(size = 7),
                          plot.title = element_text(size = 7),
                          legend.text = element_text(size = 6),
                          legend.title = element_text(size = 7),
                          strip.text.x = element_text(size = 7))
                          
# ======================================
# Colors
# ======================================

# Cell types
# https://docs.google.com/spreadsheets/d/1ApwXjEVtpPB87al6q3ab8TKvZYJTh3iNH1cuO-A_OoU/edit?usp=sharing
gs4_deauth()
tumor_tables  <- gs4_get("https://docs.google.com/spreadsheets/d/1ApwXjEVtpPB87al6q3ab8TKvZYJTh3iNH1cuO-A_OoU/edit?usp=sharing")
sheet_names(tumor_tables)
celltype_annot <- read_sheet(tumor_tables, sheet = "Cluster annotations")
head(celltype_annot)
length(unique(celltype_annot$annotation))

tumor_celltype_col <- celltype_annot$color_fig1
names(tumor_celltype_col) <- celltype_annot$annotation
tumor_celltype2_col <- celltype_annot$color_fig1
names(tumor_celltype2_col) <- celltype_annot$annotation2

celltype_annot_immune_fibro <- read_sheet(tumor_tables, sheet = "Cluster annotations, immune+fibroblast")
celltype_annot_immune_fibro$cluster <- as.character(celltype_annot_immune_fibro$cluster)
celltype_annot_immune_fibro$orig_cluster <- as.character(celltype_annot_immune_fibro$orig_cluster)
immune_fibro_celltype_col <- celltype_annot_immune_fibro$color_fig1
names(immune_fibro_celltype_col) <- celltype_annot_immune_fibro$annotation

samples <- c()
sample_col <- colorRampPalette(tableau_color_pal(palette = "Tableau 20")(20))(length(samples))
names(sample_col) <- samples

clusters <- c(0, seq(1, 20))
cluster_col <- colorRampPalette(gdocs_pal()(10))(length(clusters))
names(cluster_col) <- clusters

sample_type <- c()
sample_type_col <- c("#a8344e", "#1E5B89")
names(sample_type_col) <- sample_type


