package org.openmrs.module.kenyaemrorderentry.service;

import org.openmrs.api.OpenmrsService;
import org.openmrs.module.kenyaemrorderentry.LabManifest;
import org.openmrs.module.kenyaemrorderentry.LabManifestOrder;

import java.util.Date;
import java.util.List;

/**
 * Created by developer on 09 Nov, 2020
 */
public interface LabOrderManifestService extends OpenmrsService {
    LabManifest saveLabOrderManifest(LabManifest labManifest);
    List<LabManifest> getLabOrderManifest();
    LabManifest getLabOrderManifestById(Integer id);
    List<LabManifest> getLabOrderManifestBetweenDates(Date startDate, Date endDate);
    void voidLabOrderManifest(Integer id);

    //Methods for manifest orders
    LabManifestOrder saveLabManifestOrder(LabManifestOrder labManifestOrder);
    List<LabManifestOrder> getLabManifestOrders();
    LabManifestOrder getLabManifestOrderById(Integer id);
    List<LabManifestOrder> getLabManifestOrderByManifest(LabManifest labManifestOrder);
    void voidLabManifestOrder(Integer id);
}
