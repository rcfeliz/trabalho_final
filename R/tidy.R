# tidy
'%>%' <- magrittr::`%>%`

options(scipen = 999)

imdb <- readr::read_rds("data-raw/imdb.rds")

df <- imdb %>%
  janitor::clean_names() %>%
  dplyr::mutate(animacao = dplyr::case_when(stringr::str_detect(generos, "Animation") ~ "sim",
                                            TRUE ~ "nao")) %>%
  tidyr::separate(col = generos,
                  into = c("genero1", "genero2", "genero3", "genero4", "genero5", "genero6", "genero7", "genero8"),
                  sep = "\\|") %>%
  dplyr::mutate(faturamento_bruto = receita - orcamento)

readr::write_rds(df, "data/imdb.rds")
