library(mgcv)
library(GGally)



setwd('E:\\Air Quality - GAM')
Air_Covid_BBK <- read.csv("Air_Covid_BBK.csv")
Air_Covid_BBK[10:17]
ggpairs(Air_Covid_BBK[8:16])


mod_lm = gam(COVID_BBK ~ PM2.5_BBK + WS.BBK + RH.BBK +  AH.BBK + P_BBK + R_BBK + T.BBK, data = Air_Covid_BBK)
summary(mod_lm)

mod_lm = gam(COVID_BBK_WM ~ s(PM2.5_BBK) + s(WS.BBK) + s(RH.BBK) +  s(AH.BBK) + 
               s(P_BBK) + s(R_BBK) + s(T.BBK), data = Air_Covid_BBK, family=gaussian(link= identity))
summary(mod_lm)

AIC(mod_lm)
summary(mod_lm)$sp.criterion
summary(mod_lm)$r.sq

library(ggeffects)
library(gratia)
plot(ggeffects::ggpredict(mod_lm), facets = TRUE)
gratia::draw(mod_lm)


vis.gam(mod_lm, type = 'response', plot.type = 'contour')


vis.gam(
  mod_lm,
  type      = 'response',
  plot.type = 'persp',
  phi       = 30,
  theta     = 30,
  n.grid    = 500,
  border    = NA
)

