# From the Deep

In this problem, you'll write freeform responses to the questions provided in the specification.

## Random Partitioning

TODO Adopting this approach can help in distributing the data between the partitions more evenly, because any data has the same probability of being in any of the partitions. This also helps to execute faster queries, as there will not be a large concentration of data in specific partitions.

However, it can become harder to introduce queries due to the fact that the data is randomized. This will require more planning time. Additionally, this increases the structural interdependence between the partitions, as there will be no correlation between the data in a specific partition. Although it is very rare, it is possible for a large amount of data to become concentrated.

## Partitioning by Hour

TODO Adopting this approach can help reduce the complexity of queries because it makes it easier to query specific partitions using the time of day as the main criterion. This results in the data having more correlations with each other than in random partitioning. The management also becomes simpler.

However, this approach can cause significant problems in specific situations, requiring more planning and potentially more equipment and costs. This happens because large amounts of data can be stored in specific partitions (causing an overload) while no data is stored in other specific partitions.

## Partitioning by Hash Value

TODO Adopting this approach can help reduce a lot the complexity of queries, even making it easier to know specific data between all partitions. It, just as the random partitioning will make a very well distribion of the data between the partitions, avoiding the overcharge problem.

Homever, this approach can
