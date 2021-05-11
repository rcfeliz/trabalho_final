# Visualização

# 1) Comparações por ano
# 1.1) Nota
ggplot(comp_geral) +
  geom_line(aes(x=ano, y=nota_imdb, colour = animacao)) +
  theme(legend.position = "top") +
  scale_x_continuous(breaks=seq(1920, 2020, by = 10))

# 1.2) Faturamento
ggplot(comp_geral) +
  geom_line(aes(x=ano, y=faturamento_bruto, colour = animacao)) +
  theme(legend.position = "none") +
  scale_x_continuous(breaks=seq(1920, 2020, by = 10))

# 1.3) Orçamento
ggplot(comp_geral) +
  geom_line(aes(x=ano, y=orcamento, colour = animacao)) +
  theme(legend.position = "none") +
  scale_x_continuous(breaks=seq(1920, 2020, by = 10))

# 1.4) Receita
ggplot(comp_geral) +
  geom_line(aes(x=ano, y=receita, colour = animacao)) +
  theme(legend.position = "none") +
  scale_x_continuous(breaks=seq(1920, 2020, by = 10))

# 2) Quantidade de filmes por...
# 2.1.) ... ano
comp_geral_por_filmes %>%
  dplyr::filter(animacao == "sim") %>%
  ggplot() +
  geom_col(aes(x = ano, y = qtd_filmes), fill = "#619CFF", width = .8) +
  scale_x_continuous(breaks=seq(1920, 2020, by = 10))

# 2.2) ... período
qtd_filmes_por_periodo %>%
  dplyr::filter(!is.na(periodo)) %>%
  dplyr::filter(animacao == "sim") %>%
  ggplot() +
  geom_col(aes(x = periodo, y = qtd_filmes), fill = "#619CFF", width = .8)

# 3) Comparações gerais
# 3.1) Faturamento
ggplot(comp_geral) +
  geom_density(aes(x = faturamento_bruto, color = animacao, fill = animacao), size = 1, alpha = .3) +
  scale_x_log10()


# 3.2) Notas
library(plyr)
medias <- ddply(comp_geral, "animacao", summarise, grp.mean=mean(nota_imdb))

ggplot(comp_geral) +
  geom_density(aes(x = nota_imdb, color = animacao, fill = animacao), size = 1, alpha = .3) +
  geom_vline(data=medias, aes(xintercept=grp.mean, color=animacao),
             linetype=2, size = 1) +
  scale_x_log10()
