# ASSOCIATIVE RULE MINING

## Item Frequency

The data has a total of 9835 transactions and 169 items. The most
frequently purchased items are whole milk, other vegetables, rolls/buns
and soda.

![](ARM_Groceries_files/figure-gfm/unnamed-chunk-5-1.png)<!-- -->

## Plots re confidence, lift, and support

Plots were used to see how the rules compared in terms of confidence,
lift and support. The last plot takes order number into account.
![](ARM_Groceries_files/figure-gfm/unnamed-chunk-6-1.png)<!-- -->

![](ARM_Groceries_files/figure-gfm/unnamed-chunk-7-1.png)<!-- -->

![](ARM_Groceries_files/figure-gfm/unnamed-chunk-8-1.png)<!-- -->

## Betweeness

From the analysis we have found that whole milk and other vegetables
have very high betweeness.

![](ARM_Groceries_files/Untitled.png)<!-- -->

## Rules at various thresholds

The top 10 rules with a confidence threshold of 0.4 in terms of lift
are:

    ##                                                                rules
    ## 1    {citrus fruit,other vegetables,whole milk} => {root vegetables}
    ## 2                                       {herbs} => {root vegetables}
    ## 3                       {citrus fruit,pip fruit} => {tropical fruit}
    ## 4  {other vegetables,tropical fruit,whole milk} => {root vegetables}
    ## 5       {other vegetables,pip fruit,whole milk} => {root vegetables}
    ## 6                                  {curd,tropical fruit} => {yogurt}
    ## 7                       {beef,other vegetables} => {root vegetables}
    ## 8    {fruit/vegetable juice,other vegetables,whole milk} => {yogurt}
    ## 9            {root vegetables,tropical fruit,whole milk} => {yogurt}
    ## 10   {citrus fruit,root vegetables,whole milk} => {other vegetables}
    ##        lift
    ## 1  4.085493
    ## 2  3.956477
    ## 3  3.854060
    ## 4  3.768074
    ## 5  3.724961
    ## 6  3.690645
    ## 7  3.688692
    ## 8  3.479790
    ## 9  3.401937
    ## 10 3.273165

<!--html_preserve-->

<div id="htmlwidget-5f8b5c352561fd2c9e0f" class="visNetwork html-widget" style="width:672px;height:480px;">

</div>

<script type="application/json" data-for="htmlwidget-5f8b5c352561fd2c9e0f">{"x":{"nodes":{"id":[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21],"label":["citrus fruit","other vegetables","whole milk","herbs","pip fruit","tropical fruit","curd","beef","fruit/vegetable juice","root vegetables","yogurt","rule 1","rule 2","rule 3","rule 4","rule 5","rule 6","rule 7","rule 8","rule 9","rule 10"],"group":["item","item","item","item","item","item","item","item","item","item","item","rule","rule","rule","rule","rule","rule","rule","rule","rule","rule"],"value":[1,1,1,1,1,1,1,1,1,1,1,25.75,68.1785714285714,18.6785714285714,68.1785714285714,15.1428571428572,8.07142857142858,100,1,22.2142857142857,25.75],"color":["#CBD2FC","#CBD2FC","#CBD2FC","#CBD2FC","#CBD2FC","#CBD2FC","#CBD2FC","#CBD2FC","#CBD2FC","#CBD2FC","#CBD2FC","#EE1B1B","#EE4444","#EE6262","#EE7B7B","#EE8B8B","#EE9494","#EE9494","#EEB8B8","#EEC6C6","#EEDCDC"],"title":["citrus fruit","other vegetables","whole milk","herbs","pip fruit","tropical fruit","curd","beef","fruit/vegetable juice","root vegetables","yogurt","<B>[1]<\/B><BR><B>{citrus fruit,<BR>&nbsp;&nbsp;other vegetables,<BR>&nbsp;&nbsp;whole milk}<\/B><BR>&nbsp;&nbsp; => <B>{root vegetables}<\/B><BR><BR>support = 0.0058<BR>confidence = 0.445<BR>lift = 4.09<BR>count = 57<BR>order = 4","<B>[2]<\/B><BR><B>{herbs}<\/B><BR>&nbsp;&nbsp; => <B>{root vegetables}<\/B><BR><BR>support = 0.00702<BR>confidence = 0.431<BR>lift = 3.96<BR>count = 69<BR>order = 2","<B>[3]<\/B><BR><B>{citrus fruit,<BR>&nbsp;&nbsp;pip fruit}<\/B><BR>&nbsp;&nbsp; => <B>{tropical fruit}<\/B><BR><BR>support = 0.00559<BR>confidence = 0.404<BR>lift = 3.85<BR>count = 55<BR>order = 3","<B>[4]<\/B><BR><B>{other vegetables,<BR>&nbsp;&nbsp;tropical fruit,<BR>&nbsp;&nbsp;whole milk}<\/B><BR>&nbsp;&nbsp; => <B>{root vegetables}<\/B><BR><BR>support = 0.00702<BR>confidence = 0.411<BR>lift = 3.77<BR>count = 69<BR>order = 4","<B>[5]<\/B><BR><B>{other vegetables,<BR>&nbsp;&nbsp;pip fruit,<BR>&nbsp;&nbsp;whole milk}<\/B><BR>&nbsp;&nbsp; => <B>{root vegetables}<\/B><BR><BR>support = 0.00549<BR>confidence = 0.406<BR>lift = 3.72<BR>count = 54<BR>order = 4","<B>[6]<\/B><BR><B>{curd,<BR>&nbsp;&nbsp;tropical fruit}<\/B><BR>&nbsp;&nbsp; => <B>{yogurt}<\/B><BR><BR>support = 0.00529<BR>confidence = 0.515<BR>lift = 3.69<BR>count = 52<BR>order = 3","<B>[7]<\/B><BR><B>{beef,<BR>&nbsp;&nbsp;other vegetables}<\/B><BR>&nbsp;&nbsp; => <B>{root vegetables}<\/B><BR><BR>support = 0.00793<BR>confidence = 0.402<BR>lift = 3.69<BR>count = 78<BR>order = 3","<B>[8]<\/B><BR><B>{fruit/vegetable juice,<BR>&nbsp;&nbsp;other vegetables,<BR>&nbsp;&nbsp;whole milk}<\/B><BR>&nbsp;&nbsp; => <B>{yogurt}<\/B><BR><BR>support = 0.00508<BR>confidence = 0.485<BR>lift = 3.48<BR>count = 50<BR>order = 4","<B>[9]<\/B><BR><B>{root vegetables,<BR>&nbsp;&nbsp;tropical fruit,<BR>&nbsp;&nbsp;whole milk}<\/B><BR>&nbsp;&nbsp; => <B>{yogurt}<\/B><BR><BR>support = 0.00569<BR>confidence = 0.475<BR>lift = 3.4<BR>count = 56<BR>order = 4","<B>[10]<\/B><BR><B>{citrus fruit,<BR>&nbsp;&nbsp;root vegetables,<BR>&nbsp;&nbsp;whole milk}<\/B><BR>&nbsp;&nbsp; => <B>{other vegetables}<\/B><BR><BR>support = 0.0058<BR>confidence = 0.633<BR>lift = 3.27<BR>count = 57<BR>order = 4"],"shape":["box","box","box","box","box","box","box","box","box","box","box","circle","circle","circle","circle","circle","circle","circle","circle","circle","circle"],"x":[-0.686185323273589,0.0944374596096063,-0.0607791358851176,0.256153497414136,-1,-0.51867775765343,-0.537916018571399,1,0.769953020672988,0.0186535448257099,-0.00949284433938702,-0.239149286646619,0.155597971653153,-0.912189452577544,-0.229957193733573,-0.417072344363116,-0.406017078216656,0.526147085593878,0.312981578399956,-0.105462749075755,-0.234086371539875],"y":[-0.211359476530111,-0.103270116113204,-0.00437809887066853,-1,-0.12274034273909,0.327972509479167,1,-0.454730431258056,0.421395385190418,-0.244879861781465,0.489589662333947,-0.186942406597092,-0.686171236913949,0.0759546678740632,0.0554689375828361,-0.137221813041913,0.689636575860335,-0.314130898595297,0.236152601646285,0.192178816870848,-0.287480715566899]},"edges":{"from":[1,2,3,4,1,5,2,6,3,2,5,3,7,6,8,2,9,2,3,10,6,3,1,10,3,12,13,14,15,16,17,18,19,20,21],"to":[12,12,12,13,14,14,15,15,15,16,16,16,17,17,18,18,19,19,19,20,20,20,21,21,21,10,10,6,10,10,11,10,11,11,2],"arrows":["to","to","to","to","to","to","to","to","to","to","to","to","to","to","to","to","to","to","to","to","to","to","to","to","to","to","to","to","to","to","to","to","to","to","to"]},"nodesToDataframe":true,"edgesToDataframe":true,"options":{"width":"100%","height":"100%","nodes":{"shape":"dot","scaling":{"label":{"enabled":true}},"physics":false},"manipulation":{"enabled":false},"edges":{"smooth":false},"physics":{"stabilization":false},"interaction":{"hover":true}},"groups":["item","rule"],"width":null,"height":null,"idselection":{"enabled":true,"style":"width: 150px; height: 26px","useLabels":true,"main":"Select by id"},"byselection":{"enabled":false,"style":"width: 150px; height: 26px","multiple":false,"hideColor":"rgba(200,200,200,0.5)"},"main":null,"submain":null,"footer":null,"background":"rgba(0, 0, 0, 0)","igraphlayout":{"type":"square"},"tooltipStay":300,"tooltipStyle":"position: fixed;visibility:hidden;padding: 5px;white-space: nowrap;font-family: verdana;font-size:14px;font-color:#000000;background-color: #f5f4ed;-moz-border-radius: 3px;-webkit-border-radius: 3px;border-radius: 3px;border: 1px solid #808074;box-shadow: 3px 3px 10px rgba(0, 0, 0, 0.2);","highlight":{"enabled":true,"hoverNearest":true,"degree":1,"algorithm":"all","hideColor":"rgba(200,200,200,0.5)","labelOnly":true},"collapse":{"enabled":false,"fit":false,"resetHighlight":true,"clusterOptions":null,"keepCoord":true,"labelSuffix":"(cluster)"}},"evals":[],"jsHooks":[]}</script>

<!--/html_preserve-->

If we lower the confidence threshold to 0.1, the top 10 rules
    are:

    ##                                                                rules
    ## 1                                             {ham} => {white bread}
    ## 2                                             {white bread} => {ham}
    ## 3    {citrus fruit,other vegetables,whole milk} => {root vegetables}
    ## 4                  {butter,other vegetables} => {whipped/sour cream}
    ## 5                                       {herbs} => {root vegetables}
    ## 6                     {other vegetables,root vegetables} => {onions}
    ## 7                       {citrus fruit,pip fruit} => {tropical fruit}
    ## 8                                  {berries} => {whipped/sour cream}
    ## 9                                  {whipped/sour cream} => {berries}
    ## 10 {other vegetables,tropical fruit,whole milk} => {root vegetables}
    ##        lift
    ## 1  4.639851
    ## 2  4.639851
    ## 3  4.085493
    ## 4  4.036397
    ## 5  3.956477
    ## 6  3.875044
    ## 7  3.854060
    ## 8  3.796886
    ## 9  3.796886
    ## 10 3.768074

<!--html_preserve-->

<div id="htmlwidget-7b2e3b42e01bb0ded956" class="visNetwork html-widget" style="width:672px;height:480px;">

</div>

<script type="application/json" data-for="htmlwidget-7b2e3b42e01bb0ded956">{"x":{"nodes":{"id":[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23],"label":["ham","white bread","citrus fruit","other vegetables","whole milk","butter","herbs","root vegetables","pip fruit","berries","whipped/sour cream","tropical fruit","onions","rule 1","rule 2","rule 3","rule 4","rule 5","rule 6","rule 7","rule 8","rule 9","rule 10"],"group":["item","item","item","item","item","item","item","item","item","item","item","item","item","rule","rule","rule","rule","rule","rule","rule","rule","rule","rule"],"value":[1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,18.7692307692308,18.7692307692308,49.2307692307692,16.2307692307692,13.6923076923077,100,100,49.2307692307692],"color":["#CBD2FC","#CBD2FC","#CBD2FC","#CBD2FC","#CBD2FC","#CBD2FC","#CBD2FC","#CBD2FC","#CBD2FC","#CBD2FC","#CBD2FC","#CBD2FC","#CBD2FC","#EE1B1B","#EE1B1B","#EEABAB","#EEB1B1","#EEBDBD","#EECBCB","#EECFCF","#EED7D7","#EED7D7","#EEDCDC"],"title":["ham","white bread","citrus fruit","other vegetables","whole milk","butter","herbs","root vegetables","pip fruit","berries","whipped/sour cream","tropical fruit","onions","<B>[1]<\/B><BR><B>{ham}<\/B><BR>&nbsp;&nbsp; => <B>{white bread}<\/B><BR><BR>support = 0.00508<BR>confidence = 0.195<BR>lift = 4.64<BR>count = 50<BR>order = 2","<B>[2]<\/B><BR><B>{white bread}<\/B><BR>&nbsp;&nbsp; => <B>{ham}<\/B><BR><BR>support = 0.00508<BR>confidence = 0.121<BR>lift = 4.64<BR>count = 50<BR>order = 2","<B>[3]<\/B><BR><B>{citrus fruit,<BR>&nbsp;&nbsp;other vegetables,<BR>&nbsp;&nbsp;whole milk}<\/B><BR>&nbsp;&nbsp; => <B>{root vegetables}<\/B><BR><BR>support = 0.0058<BR>confidence = 0.445<BR>lift = 4.09<BR>count = 57<BR>order = 4","<B>[4]<\/B><BR><B>{butter,<BR>&nbsp;&nbsp;other vegetables}<\/B><BR>&nbsp;&nbsp; => <B>{whipped/sour cream}<\/B><BR><BR>support = 0.0058<BR>confidence = 0.289<BR>lift = 4.04<BR>count = 57<BR>order = 3","<B>[5]<\/B><BR><B>{herbs}<\/B><BR>&nbsp;&nbsp; => <B>{root vegetables}<\/B><BR><BR>support = 0.00702<BR>confidence = 0.431<BR>lift = 3.96<BR>count = 69<BR>order = 2","<B>[6]<\/B><BR><B>{other vegetables,<BR>&nbsp;&nbsp;root vegetables}<\/B><BR>&nbsp;&nbsp; => <B>{onions}<\/B><BR><BR>support = 0.00569<BR>confidence = 0.12<BR>lift = 3.88<BR>count = 56<BR>order = 3","<B>[7]<\/B><BR><B>{citrus fruit,<BR>&nbsp;&nbsp;pip fruit}<\/B><BR>&nbsp;&nbsp; => <B>{tropical fruit}<\/B><BR><BR>support = 0.00559<BR>confidence = 0.404<BR>lift = 3.85<BR>count = 55<BR>order = 3","<B>[8]<\/B><BR><B>{berries}<\/B><BR>&nbsp;&nbsp; => <B>{whipped/sour cream}<\/B><BR><BR>support = 0.00905<BR>confidence = 0.272<BR>lift = 3.8<BR>count = 89<BR>order = 2","<B>[9]<\/B><BR><B>{whipped/sour cream}<\/B><BR>&nbsp;&nbsp; => <B>{berries}<\/B><BR><BR>support = 0.00905<BR>confidence = 0.126<BR>lift = 3.8<BR>count = 89<BR>order = 2","<B>[10]<\/B><BR><B>{other vegetables,<BR>&nbsp;&nbsp;tropical fruit,<BR>&nbsp;&nbsp;whole milk}<\/B><BR>&nbsp;&nbsp; => <B>{root vegetables}<\/B><BR><BR>support = 0.00702<BR>confidence = 0.411<BR>lift = 3.77<BR>count = 69<BR>order = 4"],"shape":["box","box","box","box","box","box","box","box","box","box","box","box","box","circle","circle","circle","circle","circle","circle","circle","circle","circle","circle"],"x":[0.822046298775884,0.888345550713478,-0.178130607676312,-0.383281854870883,-0.00663926752867972,0.199714752910017,-0.91920931435511,-0.639423796593413,0.479300473564739,-0.199490550632131,-0.174444913043083,0.107038264726135,-1,0.717480425640003,1,-0.346932589109233,-0.138889983985789,-0.923947333926401,-0.759273451486521,0.166812893194003,-0.425550462018373,0.0499784813639357,-0.228580250247869],"y":[0.273339300942319,-0.221892176369913,-0.921742420843461,-0.0711574083032306,-0.396958200592235,0.382363580517641,-0.845452679508242,-0.361889646957413,-1,1,0.642851229230522,-0.667991422134402,0.223504235813375,0.00411906265350859,0.0480428627535039,-0.530088602915312,0.297550181637046,-0.560092310995401,-0.00791023017762482,-0.977988863483785,0.822419571344981,0.871211215135804,-0.355043373823534]},"edges":{"from":[1,2,3,4,5,6,4,7,4,8,3,9,10,11,4,12,5,14,15,16,17,18,19,20,21,22,23],"to":[14,15,16,16,16,17,17,18,19,19,20,20,21,22,23,23,23,2,1,8,11,8,13,12,11,10,8],"arrows":["to","to","to","to","to","to","to","to","to","to","to","to","to","to","to","to","to","to","to","to","to","to","to","to","to","to","to"]},"nodesToDataframe":true,"edgesToDataframe":true,"options":{"width":"100%","height":"100%","nodes":{"shape":"dot","scaling":{"label":{"enabled":true}},"physics":false},"manipulation":{"enabled":false},"edges":{"smooth":false},"physics":{"stabilization":false},"interaction":{"hover":true}},"groups":["item","rule"],"width":null,"height":null,"idselection":{"enabled":true,"style":"width: 150px; height: 26px","useLabels":true,"main":"Select by id"},"byselection":{"enabled":false,"style":"width: 150px; height: 26px","multiple":false,"hideColor":"rgba(200,200,200,0.5)"},"main":null,"submain":null,"footer":null,"background":"rgba(0, 0, 0, 0)","igraphlayout":{"type":"square"},"tooltipStay":300,"tooltipStyle":"position: fixed;visibility:hidden;padding: 5px;white-space: nowrap;font-family: verdana;font-size:14px;font-color:#000000;background-color: #f5f4ed;-moz-border-radius: 3px;-webkit-border-radius: 3px;border-radius: 3px;border: 1px solid #808074;box-shadow: 3px 3px 10px rgba(0, 0, 0, 0.2);","highlight":{"enabled":true,"hoverNearest":true,"degree":1,"algorithm":"all","hideColor":"rgba(200,200,200,0.5)","labelOnly":true},"collapse":{"enabled":false,"fit":false,"resetHighlight":true,"clusterOptions":null,"keepCoord":true,"labelSuffix":"(cluster)"}},"evals":[],"jsHooks":[]}</script>

<!--/html_preserve-->

Here we see a graph of the rules with a lift of higher than 3.5:

![](ARM_Groceries_files/figure-gfm/unnamed-chunk-13-1.png)<!-- -->

## Conclusion

This information can be used for strategic placement of products in a
grocery store. E.g. given the high lift linking herbs with root
vegatables, placing them near each other could increase sales of these
products or alternativley, placing them on opposite sides of the store
would force people to walk through multiple aisles and increase their
chances of purchasing other products.
