package com.zlzkj.app.model;

public class MakerParts {
    private Integer id;

    private String partsId;

    private String partsName;

    private String partsPicture;

    private String partsDecsription;

    private String productionTime;

    private String productionArea;

    private String belongs;

    private String signatureOne;

    private String firstSigntime;

    private String signatureTwo;

    private String secondSigntime;

    private Integer status;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getPartsId() {
        return partsId;
    }

    public void setPartsId(String partsId) {
        this.partsId = partsId == null ? null : partsId.trim();
    }

    public String getPartsName() {
        return partsName;
    }

    public void setPartsName(String partsName) {
        this.partsName = partsName == null ? null : partsName.trim();
    }

    public String getPartsPicture() {
        return partsPicture;
    }

    public void setPartsPicture(String partsPicture) {
        this.partsPicture = partsPicture == null ? null : partsPicture.trim();
    }

    public String getPartsDecsription() {
        return partsDecsription;
    }

    public void setPartsDecsription(String partsDecsription) {
        this.partsDecsription = partsDecsription == null ? null : partsDecsription.trim();
    }

    public String getProductionTime() {
        return productionTime;
    }

    public void setProductionTime(String productionTime) {
        this.productionTime = productionTime == null ? null : productionTime.trim();
    }

    public String getProductionArea() {
        return productionArea;
    }

    public void setProductionArea(String productionArea) {
        this.productionArea = productionArea == null ? null : productionArea.trim();
    }

    public String getBelongs() {
        return belongs;
    }

    public void setBelongs(String belongs) {
        this.belongs = belongs == null ? null : belongs.trim();
    }

    public String getSignatureOne() {
        return signatureOne;
    }

    public void setSignatureOne(String signatureOne) {
        this.signatureOne = signatureOne == null ? null : signatureOne.trim();
    }

    public String getFirstSigntime() {
        return firstSigntime;
    }

    public void setFirstSigntime(String firstSigntime) {
        this.firstSigntime = firstSigntime == null ? null : firstSigntime.trim();
    }

    public String getSignatureTwo() {
        return signatureTwo;
    }

    public void setSignatureTwo(String signatureTwo) {
        this.signatureTwo = signatureTwo == null ? null : signatureTwo.trim();
    }

    public String getSecondSigntime() {
        return secondSigntime;
    }

    public void setSecondSigntime(String secondSigntime) {
        this.secondSigntime = secondSigntime == null ? null : secondSigntime.trim();
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }
}