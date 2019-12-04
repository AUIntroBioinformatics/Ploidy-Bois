# Ploidy Boi's Step 5

Kyle David, Sarah Martin, and Yan Yu

## Tetraploids
### Assembly 
De Novo Tetraploid genomes were assembled using two different methods provided by the 10X Genomics Supernova pipeline. The first method, pseudohap, produces a single record per scaffold, flattening bubbles and joining gaps (Fig 1A). With the pseudohap method paternal and maternal alleles are selected randomly. The second method, raw, is the most detailed method under which every edge in the assembly is represented by a record including all bubbles, reverse complements, alleles, and gaps (Fig 1B).

![Figure 1](figures/step5/Fig1.png)
#### Figure 1
Unsurprisingly, in terms of de novo assembly the pseudohap option produced fewer, larger, sequence records than the raw option across all coverage levels (Table 1). Also unsurprisingly, assemblies improved across both strategies as coverage increased. The highest level of coverage had roughly twice the N50 as the second highest coverage, which in turn had about twice the N50 of the third highest. However it is worth noting that all strategies and coverage levels produced extremely poor de novo genomes with thousands of scaffolds. As a result we would not recommend this approach for a system without a good reference to be aligned to after assembly.
#### pseudohap assemblies
 Coverage| 3X  | 6X  | 12X  | 24X 
--- | --- | --- | --- | ---
number of records | 2037 | 18590 | 2968 | 2126  
avg. record length | 1393.17 | 3217| 34604.73 | 48507.72 
N50 | 1326 | 4298 | 577793 | 1385223
### raw assemblies
 Coverage| 3X  | 6X  | 12X  | 24X 
--- | --- | --- | --- | ---
number of records | 53924 | 201074 | 145098 | 148888  
avg. record length | 413.65 | 756.16| 2515.27 | 2671.34
N50 | 530 | 1802 | 22489 | 39973

### Alignment
[Sarah?]

## SNPs
[Sarah?]

## Duplication & Inversions
[Yan?]