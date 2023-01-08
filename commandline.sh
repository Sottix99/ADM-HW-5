

#First question: What is the most popular pair of heroes (often appearing together in the comics)?


echo 'The most popular pair of heroes (often appearing together in the comics) is:'
awk -F, '{array[$1","$2]++} END { for (i in array) {print array[i]"," i}}' clean_hero_network.csv | sort -k 1 | tail -1


#Second question: Number of comics per hero


echo 'The number of comics per hero is:'
cut -d, -f1 clean_edges.csv | awk 'NR>1' | sort | uniq -c | sort -k1 | tail


#Third question: The average number of heroes in comics


echo 'The average number of heroes in comics is:'
cut -d, -f2 clean_edges.csv | awk 'NR>1' | sort | uniq -c | awk '{sum+=$1}END{printf "%.0f\n", (sum/NR)}'








