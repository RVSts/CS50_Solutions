# From the Deep

In this problem, you'll write freeform responses to the questions provided in the specification.

## Random Partitioning

TODO Adopting this approach can help in distributing the data between the partitions more evenly, because any data has the same probability of being in any of the partitions. This also helps to execute faster queries, as there will not be a large concentration of data in specific partitions.

However, it can become harder to introduce queries due to the fact that the data is randomized. This will require more planning time. Additionally, this increases the structural interdependence between the partitions, as there will be no correlation between the data in a specific partition. Although it is very rare, it is possible for a large amount of data to become concentrated.

## Partitioning by Hour

TODO

## Partitioning by Hash Value

TODO
