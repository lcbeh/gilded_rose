# gilded_rose

### The Brief

A well known kata developed by Terry Hughes.

*"Hi and welcome to team Gilded Rose. As you know, we are a small inn with a prime location in a prominent city ran by a friendly innkeeper named Allison. We also buy and sell only the finest goods. Unfortunately, our goods are constantly degrading in quality as they approach their sell by date. We have a system in place that updates our inventory for us. It was developed by a no-nonsense type named Leeroy, who has moved on to new adventures. Your task is to add the new feature to our system so that we can begin selling a new category of items. First an introduction to our system:

All items have a SellIn value which denotes the number of days we have to sell the item All items have a Quality value which denotes how valuable the item is At the end of each day our system lowers both values for every item Pretty simple, right? Well this is where it gets interesting:

Once the sell by date has passed, Quality degrades twice as fast
The Quality of an item is never negative
“Aged Brie” actually increases in Quality the older it gets
The Quality of an item is never more than 50
“Sulfuras”, being a legendary item, never has to be sold or decreases in Quality
“Backstage passes”, like aged brie, increases in Quality as it’s SellIn value approaches; Quality increases by 2 when there are 10 days or less and by 3 when there are 5 days or less but Quality drops to 0 after the concert
We have recently signed a supplier of conjured items. This requires an update to our system:

“Conjured” items degrade in Quality twice as fast as normal items
Feel free to make any changes to the UpdateQuality method and add any new code as long as everything still works correctly. However, do not alter the Item class or Items property as those belong to the goblin in the corner who will insta-rage and one-shot you as he doesn’t believe in shared code ownership (you can make the UpdateQuality method and Items property static if you like, we’ll cover for you)."*

### Approach

My approach to tackle the problem:
1. Read and understand the requirements
2. Interact with the code in IRB to check its functionality
3. Write tests for all features and ensure that the legacy code works in all cases
4. Refactor each case by product
5. Arrive at a solution where each product is assessed by type and then call to the associated methods. For example, if item.name == "Aged Brie", then update_Aged_Brie method would be executed.
6. Make each product a child of Item class and move the associated methods into the class.
7. Ensure all tests still passed.
