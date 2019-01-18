#!/bin/bash

echo "Enter password"
read trythis

while [ "$trythis" != "ljs" ]; do
    echo "Sorry, try again"
    read trythis
done

exit 0
