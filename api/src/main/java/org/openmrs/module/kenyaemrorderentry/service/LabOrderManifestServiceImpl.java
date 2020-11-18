package org.openmrs.module.kenyaemrorderentry.service;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.openmrs.module.kenyaemrorderentry.LabManifest;
import org.openmrs.module.kenyaemrorderentry.LabManifestOrder;
import org.openmrs.module.kenyaemrorderentry.db.LabOrderManifestDaoImpl;

import java.util.Date;
import java.util.List;

/**
 * Created by developer on 09 Nov, 2020
 */
public class LabOrderManifestServiceImpl implements LabOrderManifestService{
    protected final Log log = LogFactory.getLog(this.getClass());

    private LabOrderManifestDaoImpl labOrderManifestDao;
    //private LabManifestOrderDaoImpl labManifestOrderDaoImpl;

    @Override
    public LabManifest saveLabOrderManifest(LabManifest labManifest) {
        return labOrderManifestDao.saveLabOrderManifest(labManifest);
    }

    @Override
    public List<LabManifest> getLabOrderManifest() {
        return labOrderManifestDao.getLabOrderManifest();
    }

    @Override
    public LabManifest getLabOrderManifestById(Integer id) {
        return labOrderManifestDao.getLabOrderManifestById(id);
    }

    @Override
    public List<LabManifest> getLabOrderManifestBetweenDates(Date startDate, Date endDate) {
        return labOrderManifestDao.getLabOrderManifestBetweenDates(startDate,endDate);
    }

    @Override
    public void voidLabOrderManifest(Integer id) {
         labOrderManifestDao.voidLabOrderManifest(id);
    }


    //Methods for lab manifest orders
    @Override
    public LabManifestOrder saveLabManifestOrder(LabManifestOrder labManifestOrder) {
        return labOrderManifestDao.saveLabManifestOrder(labManifestOrder);
    }

    @Override
    public List<LabManifestOrder> getLabManifestOrders() {
        return labOrderManifestDao.getLabManifestOrders();
    }

    @Override
    public LabManifestOrder getLabManifestOrderById(Integer id) {
        return labOrderManifestDao.getLabManifestOrderById(id);
    }

    @Override
    public List<LabManifestOrder> getLabManifestOrderByManifest(LabManifest labManifest) {
        return labOrderManifestDao.getLabManifestOrderByManifest(labManifest);
    }

    @Override
    public void voidLabManifestOrder(Integer id) {
        labOrderManifestDao.voidLabManifestOrder(id);
    }

    public LabOrderManifestDaoImpl getLabOrderManifestDao() {
        return labOrderManifestDao;
    }

    public void setLabOrderManifestDao(LabOrderManifestDaoImpl labOrderManifestDao) {
        this.labOrderManifestDao = labOrderManifestDao;
    }

    @Override
    public void onStartup() {

    }

    @Override
    public void onShutdown() {

    }
}
