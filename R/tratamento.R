# bases intermediárias

'%>%' <- magrittr::`%>%`

options(scipen = 999)

imdb <- readr::read_rds("data/imdb.rds")

# 1) Comparações gerais
comp_geral <- imdb %>%
  dplyr::group_by(animacao, ano) %>%
  dplyr::summarise(dplyr::across(
    where(is.numeric),
    mean,
    na.rm = TRUE
  ))

# 2) Quantidade de filmes
qtd_filmes <- imdb %>%
  dplyr::mutate(faturamento_bruto = receita - orcamento) %>%
  dplyr::group_by(animacao, ano) %>%
  dplyr::summarise(qtd_filmes = dplyr::n())

comp_geral_por_filmes <- dplyr::full_join(comp_geral, qtd_filmes)

# Períodos
periodo <- imdb %>%
  dplyr::mutate(periodo = dplyr::case_when(
    ano < 1908 ~ "Fundação",
    ano >= 1908 & ano < 1928 ~ "Pioneiros",
    ano >= 1928 & ano < 1951 ~ "Anos de ouro",
    ano >= 1951 & ano < 1960 ~ "O nascimento de algo novo",
    ano >= 1960 & ano < 1991 ~ "Os três mercados",
    ano > 1991 ~ "Atualmente"
  )) %>%
  dplyr::mutate(periodo = forcats::fct_rev(forcats::as_factor(periodo)))

qtd_filmes_por_periodo <- periodo %>%
  dplyr::group_by(animacao, periodo) %>%
  dplyr::summarise(qtd_filmes = dplyr::n()) %>%
  dplyr::ungroup()

qtd_filmes_por_periodo %>%
  dplyr::filter(!is.na(periodo)) %>%
  dplyr::filter(animacao == "sim") %>%
  ggplot() +
  geom_col(aes(x = periodo, y = qtd_filmes), fill = "#619CFF", width = .8)

comp_geral_por_filmes %>%
  dplyr::filter(animacao == "sim") %>%
  ggplot() +
  geom_col(aes(x = ano, y = qtd_filmes), fill = "#619CFF", width = .8) +
  scale_x_continuous(breaks=seq(1920, 2020, by = 10))
