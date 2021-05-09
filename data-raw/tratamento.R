# tratamento

'%>%' <- magrittr::`%>%`

imdb <- readr::read_rds("C://Users/ABJ/Documents/curso-r/r4ds-II/data/imdb.rds")
readr::write_rds(imdb, "data-raw/imdb.rds")
# cetesb <- readr::read_rds("C://Users/ABJ/Documents/curso-r/r4ds-II/data/cetesb.rds")
ssp <- readr::read_rds("data-raw/ssp.rds")
imdb <- readr::read_rds("data-raw/imdb.rs")
ibge <- readr::read_rds("data-raw/ibge.rds")

patrimoniais <- ssp %>%
  dplyr::select(tidyselect::starts_with("furto") | tidyselect::starts_with("roubo")) %>%
  dplyr::mutate(crimes_patrimoniais = sum())

df <- ssp %>%
  # juntar mes-ano num formato UTC
  tidyr::unite(data, ano, mes, sep = "-") %>%
  dplyr::mutate(data_nova = lubridate::ym(data)) %>%
  dplyr::mutate(data = stringr::str_remove(data_nova, pattern = "-01")) %>%
  dplyr::rowwise(data, delegacia_nome) %>%
  # crimes patrimoniais
  dplyr::mutate(crimes_patrimoniais = sum(dplyr::c_across(tidyselect::starts_with("roubo"))))

 # crimes contra a vida
  dplyr::mutate(crimes_contra_vida = )

ibge <- ibge %>%
  dplyr::filter(uf_sigla == "SP", ano == 2010)

ibge$muni_nm <- stringi::stri_trans_general(ibge$muni_nm, "Latin-ASCII")

ssp$municipio_nome <- stringi::stri_trans_general(ssp$municipio_nome, "Latin-ASCII")
ssp$municipio_nome <- stringr::str_to_upper(ssp$municipio_nome)

crimes <- c("estupro", "estupro_total")

df <- ssp %>%
  dplyr::select(!c(delegacia_nome, regiao_nome, mes)) %>%
  dplyr::filter(ano == 2010) %>%
  dplyr::mutate(total_crimes = dplyr::rowwise(crimes))

# Caio falou pra eu usar
purrr::set_names(ssp)
dplyr::rename_with()

# pra NSE, eu pensei em INVERTER linha com coluna
# depois de inverter tudo, eu dou slice nas coluna (espero que elas continuem ordenadas)
#

