package org.openmrs.module.kenyaemrorderentry;

import org.openmrs.BaseOpenmrsData;

import java.util.Date;
import java.util.UUID;

/**
 * Created by developer on 09 Nov, 2020
 */
public class LabManifest extends BaseOpenmrsData {
    private Integer id;
    private Date startDate;
    private Date endDate;
    private Date dispatchDate;
    private String courier;
    private String courierOfficer;
    private String status;
    private Date dateCreated;
    private Date dateChanged;
    private Boolean voided;
    private Date dateVoided;
    private String voidReason;
    private String uuid;

    public LabManifest() {
        prePersist();
    }

    public LabManifest(Date startDate, Date endDate, Date dispatchDate, String courier, String courierOfficer, String status, Date dateCreated, Date dateChanged, Boolean voided, Date dateVoided, String voidReason, String uuid) {
        this.startDate = startDate;
        this.endDate = endDate;
        this.dispatchDate = dispatchDate;
        this.courier = courier;
        this.courierOfficer = courierOfficer;
        this.status = status;
        this.dateCreated = dateCreated;
        this.dateChanged = dateChanged;
        this.voided = voided;
        this.dateVoided = dateVoided;
        this.voidReason = voidReason;
        this.uuid = uuid;
    }

    @Override
    public Integer getId() {
        return id;
    }

    @Override
    public void setId(Integer id) {
        this.id = id;
    }

    public Date getStartDate() {
        return startDate;
    }

    public void setStartDate(Date startDate) {
        this.startDate = startDate;
    }

    public Date getEndDate() {
        return endDate;
    }

    public void setEndDate(Date endDate) {
        this.endDate = endDate;
    }

    public Date getDispatchDate() {
        return dispatchDate;
    }

    public void setDispatchDate(Date dispatchDate) {
        this.dispatchDate = dispatchDate;
    }

    public String getCourier() {
        return courier;
    }

    public void setCourier(String courier) {
        this.courier = courier;
    }

    public String getCourierOfficer() {
        return courierOfficer;
    }

    public void setCourierOfficer(String courierOfficer) {
        this.courierOfficer = courierOfficer;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    @Override
    public Date getDateCreated() {
        return dateCreated;
    }

    @Override
    public void setDateCreated(Date dateCreated) {
        this.dateCreated = dateCreated;
    }

    @Override
    public Date getDateChanged() {
        return dateChanged;
    }

    @Override
    public void setDateChanged(Date dateChanged) {
        this.dateChanged = dateChanged;
    }

    @Override
    public Boolean getVoided() {
        return voided;
    }

    @Override
    public void setVoided(Boolean voided) {
        this.voided = voided;
    }

    @Override
    public Date getDateVoided() {
        return dateVoided;
    }

    @Override
    public void setDateVoided(Date dateVoided) {
        this.dateVoided = dateVoided;
    }

    @Override
    public String getVoidReason() {
        return voidReason;
    }

    @Override
    public void setVoidReason(String voidReason) {
        this.voidReason = voidReason;
    }

    @Override
    public String getUuid() {
        return uuid;
    }

    @Override
    public void setUuid(String uuid) {
        this.uuid = uuid;
    }

    public void prePersist() {

        if (null == getUuid())
            setUuid(UUID.randomUUID().toString());
    }

}
