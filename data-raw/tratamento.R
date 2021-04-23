# tratamento

'%>%' <- magrittr::`%>%`

# cetesb <- readr::read_rds("C://Users/ABJ/Documents/curso-r/r4ds-II/data/cetesb.rds")
ssp <- readr::read_rds("data-raw/ssp.rds")
ibge <- readr::read_rds("data-raw/ibge.rds")

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

