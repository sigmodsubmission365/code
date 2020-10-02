FOLDS=10
OUTPUT_FOLDER_NAIVE="out-naive"
OUTPUT_FOLDER_OLKEN="out-olken"

mkdir out-olken
mkdir out-naive

for i in `seq 6 $FOLDS`;
do
	echo "Fold $i"
	java -jar ../../dist/Castor.jar -parameters castor-input/parameters-naive.json -inds castor-input/inds.json -dataModel castor-input/datamodel.json -trainPosSuffix "_FOLD${i}_TRAIN_POS" -trainNegSuffix "_FOLD${i}_TRAIN_NEG" -testPosSuffix "_FOLD${i}_TEST_POS" -testNegSuffix "_FOLD${i}_TEST_NEG" -test -outputSQL > "${OUTPUT_FOLDER_NAIVE}/fold${i}.txt" &
	
	java -jar ../../dist/Castor.jar -parameters castor-input/parameters-olken.json -inds castor-input/inds.json -dataModel castor-input/datamodel.json -trainPosSuffix "_FOLD${i}_TRAIN_POS" -trainNegSuffix "_FOLD${i}_TRAIN_NEG" -testPosSuffix "_FOLD${i}_TEST_POS" -testNegSuffix "_FOLD${i}_TEST_NEG" -test -outputSQL > "${OUTPUT_FOLDER_OLKEN}/fold${i}.txt"
	
done
