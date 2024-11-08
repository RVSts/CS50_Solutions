# From the Deep

In this problem, you'll write freeform responses to the questions provided in the specification.

## Random Partitioning

TODO Adopting this approach can help in distributing the data between the partitions more evenly, because any data has the same probability of being in any of the partitions. This also helps to execute faster queries, as there will not be a large concentration of data in specific partitions.

However, it can become harder to introduce queries due to the fact that the data is randomized. This will require more planning time. Additionally, this increases the structural interdependence between the partitions, as there will be no correlation between the data in a specific partition. Although it is very rare, it is possible for a large amount of data to become concentrated.

## Partitioning by Hour

TODO Adopting this approach can help in reducing the complexity of the queries, because it make more easier to do query in specific partitions using the time of the day as its main function. This make the data have more correlations between themselves than on the random partitioning. The management also become more simple.

Homever, this data can cause a big problem in specific situetions, requering more planning and maybe more equipaments and costs. This happens because large amount of data can be stored in specific partitions (causing a overcharge) while none data will be stored in others specific partitions

## Partitioning by Hash Value

TODO
