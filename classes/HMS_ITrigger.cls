/**
 * Created by BRITENET on 11.11.2019.
 */

public interface HMS_ITrigger {
    void beforeInsertOrUpdate(List<SObject> newSObjects);
    void afterInsert(List<SObject> newSObjects);
    void afterUpdate(List<SObject> newSObjects);
    void afterDelete(List<SObject> newSObjects);
    void beforeInsert(List<SObject> newSObjects);
    void beforeUpdate(List<SObject> newSObjects);
    void beforeDelete(List<SObject> newSObjects);

}