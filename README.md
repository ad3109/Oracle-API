# DIY Oracle, Proxy, and API Contract Info
Oracle code repository for DIY version using commodities-api for larger # of testnet feeds than what you get using LINK
Proxy code using a replacement commodity api when the price falls to $0

API Notes
 Crypto Compare Free Rest API - this is just crypto, but it is working w/ LINK testnets
    https://min-api.cryptocompare.com/documentation & https://min-api.cryptocompare.com/faq

LINK API Docs: https://docs.chain.link/any-api/introduction
    PLEASE NOTE: Commodities API is deprictaed bec the service is pay-go now

Commodities API Key via https://commodities-api.com/ i_anyApi_jobId = "fcf4140d696d44b687012232948bdd5d"; req.add("get", "https://commodities-api.com/api/latest?access_key=ho90ir8l3777dymv9s6vzblbt5p34udvu3bqub662168au23b963x0gzq7kg"); req.add("path", "x.data.rates.COFFEE"); - can replace COFFEE with BRENTOIL, CORN, etc

JSON RAW Commodities API sample data, parse via - https://jsonpathfinder.com/ {"data":{"success":true,"timestamp":1681432200,"date":"2023-04-14","base":"USD","rates": {"BRENTOIL":0.011618450098757,"COCOA":0.00034258307639603,"COFFEE":0.51190171487074,"CORN":0.15319800842589,"COTTON":1.2048192771084,"CPO":0.00470667088414 63,"ETHANOL":0.462748727441,"LUMBER":0.0024301336573512,"NG":0.49431537320811,"RICE":0.056882821387941,"ROBUSTA":0.0004180602006689,"RUBBER":0.625,"SOYBEAN ":0.066666666666667,"SUGAR":4.1597337770383,"WHEAT":0.0036618876591456,"WTIOIL":0.012168410805549,"XAG":0.038744118109344,"XAU":0.00049022083377508,"XPD":0 .00069252077562327,"XPT":0.0009532888465205,"XRH":0.00013333333333333},"unit":"per barrel for Oil, per ounce for Metals. Per 10 metric tons for Crude Palm Oil, Per MMBtu for Natural gas, Per Gallon for Ethanol. Per metric ton, per lb or per bushel for Agriculture"}}
