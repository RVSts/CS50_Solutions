# From the Deep

In this problem, you'll write freeform responses to the questions provided in the specification.

## Random Partitioning

TODO Adopting this approach can help in distributing the data between the partitions more evenly, because any data has the same probability of being in any of the partitions. This also helps to execute faster queries, as there will not be a large concentration of data in specific partitions.

However, it can become harder to introduce queries due to the fact that the data is randomized. This will require more planning time. Additionally, this increases the structural interdependence between the partitions, as there will be no correlation between the data in a specific partition. Although it is very rare, it is possible for a large amount of data to become concentrated.

## Partitioning by Hour

TODO Adopting this approach can help reduce the complexity of queries because it makes it easier to query specific partitions using the time of day as the main criterion. This results in the data having more correlations with each other than in random partitioning. The management also becomes simpler.

However, this approach can cause significant problems in specific situations, requiring more planning and potentially more equipment and costs. This happens because large amounts of data can be stored in specific partitions (causing an overload) while no data is stored in other specific partitions.

## Partitioning by Hash Value

TODO Adopting hash partitioning can significantly reduce query complexity and facilitate access to specific data across partitions. It tends to distribute data uniformly, helping to avoid issues related to data imbalance. The effectiveness of this approach relies on the quality of the hash function used, which is crucial for ensuring effective data distribution and minimizing future maintenance problems. Additionally, hash partitioning allows for the selection of specific values to generate corresponding hash values, making it a flexible option.

However, hash partitioning is not without its challenges. The requirement for a well-designed hash function is essential, as a poor implementation can lead to uneven data distribution and potential performance issues. Furthermore, this approach does not necessitate a pre-established amount of data for each value, which can lead to complications if the data distribution is not managed properly. Queries that do not utilize the hash key may become more complex, requiring access to multiple partitions.
