/**
 * Created by BRITENET on 19.11.2019.
 */

public with sharing class HMS_CountryWrapper {

        public String countryLabel { get; set; }
        public String countryValue { get; set; }

    public HMS_CountryWrapper(String label, String value){
            countryLabel = label;
            countryValue = value;
        }

}