package com.zlzkj.app.model;

public class MakerGoods {
    private Integer id;

    private String goodsId;

    private String goodsName;

    private String goodsPicture;

    private Double goodsPrice;

    private String goodsMaterial;

    private String goodsDescription;

    private String makingTime;

    private String productionTime;

    private String productionArea;

    private String qualityGuarantee;

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

    public String getGoodsId() {
        return goodsId;
    }

    public void setGoodsId(String goodsId) {
        this.goodsId = goodsId == null ? null : goodsId.trim();
    }

    public String getGoodsName() {
        return goodsName;
    }

    public void setGoodsName(String goodsName) {
        this.goodsName = goodsName == null ? null : goodsName.trim();
    }

    public String getGoodsPicture() {
        return goodsPicture;
    }

    public void setGoodsPicture(String goodsPicture) {
        this.goodsPicture = goodsPicture == null ? null : goodsPicture.trim();
    }

    public Double getGoodsPrice() {
        return goodsPrice;
    }

    public void setGoodsPrice(Double goodsPrice) {
        this.goodsPrice = goodsPrice;
    }

    public String getGoodsMaterial() {
        return goodsMaterial;
    }

    public void setGoodsMaterial(String goodsMaterial) {
        this.goodsMaterial = goodsMaterial == null ? null : goodsMaterial.trim();
    }

    public String getGoodsDescription() {
        return goodsDescription;
    }

    public void setGoodsDescription(String goodsDescription) {
        this.goodsDescription = goodsDescription == null ? null : goodsDescription.trim();
    }

    public String getMakingTime() {
        return makingTime;
    }

    public void setMakingTime(String makingTime) {
        this.makingTime = makingTime == null ? null : makingTime.trim();
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

    public String getQualityGuarantee() {
        return qualityGuarantee;
    }

    public void setQualityGuarantee(String qualityGuarantee) {
        this.qualityGuarantee = qualityGuarantee == null ? null : qualityGuarantee.trim();
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