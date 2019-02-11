package com.hrtxn.flchappinessmall.service.serviceImpl;

import com.hrtxn.flchappinessmall.common.BrandConmmon;
import com.hrtxn.flchappinessmall.exception.GoodsVoListNotNullException;
import com.hrtxn.flchappinessmall.mapper.BrandMapper;
import com.hrtxn.flchappinessmall.mapper.GoodsMapper;
import com.hrtxn.flchappinessmall.pojo.Brand;
import com.hrtxn.flchappinessmall.pojo.pojoVo.GoodsVo;
import com.hrtxn.flchappinessmall.service.BrandService;
import com.hrtxn.flchappinessmall.tools.Constant;
import com.hrtxn.flchappinessmall.tools.QiniuUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

/**
 * Author:封润
 * Date:2018-10-23 下午 3:52
 * Description:<品牌逻辑层实现类>
 */
@Service
@Transactional(propagation = Propagation.REQUIRED, rollbackFor = Exception.class)//事物默认隔离级别,回滚:任何异常都会回滚
public class BrandServiceImpl implements BrandService {
    @Autowired//品牌
    private BrandMapper brandMapper;
    @Autowired//商品
    private GoodsMapper goodsMapper;

    /**
     * 获取品牌列表
     *
     * @return
     */
    @Override
    @Transactional(readOnly = true)//只读事务
    public List<Brand> getBrandAll() {
        List<Brand> brandsList = brandMapper.selectBrandAll();
        return brandsList;
    }

    /**
     * 修改品牌状态
     *
     * @param id
     */
    @Override
    public void modfyBrandType(Integer id) {
        Brand brand = brandMapper.selectByPrimaryKey(id);
        if (brand.getBrandType() == BrandConmmon.BRAND_TYPE_TRUE) {//常量值:1 代表显示状态
            brand.setBrandType(BrandConmmon.BRAND_TYPE_FALSE);//状态反转
        } else if (brand.getBrandType() == BrandConmmon.BRAND_TYPE_FALSE) {//常量值:2 代表隐藏状态
            brand.setBrandType(BrandConmmon.BRAND_TYPE_TRUE);
        }
        //修改品牌
        brandMapper.updateByPrimaryKeySelective(brand);
    }

    /**
     * 删除品牌(真实删除)
     *
     * @param brand
     */
    @Override
    public void removeBrand(Brand brand) throws GoodsVoListNotNullException {

        List<GoodsVo> goodsVoList = goodsMapper.selectByBrandId(brand.getId());
        //获取属于品牌的货品是否为空,为空则进行删除品牌和删除图片,否则
        if (goodsVoList.isEmpty()) {
            brandMapper.deleteByPrimaryKey(brand.getId());
            //删除七牛云文件
            String[] imgUrlArray = brand.getBrandLogo().split("/");
            QiniuUtils.deleteqiniu(Constant.PIN_PAI, imgUrlArray[3]);//第三个就是其文件名加后缀
        } else {
            throw new GoodsVoListNotNullException("该品牌下还有商品,无法删除");
        }
    }

    /**
     * 根据品牌Id查询品牌
     *
     * @param id
     * @return
     */
    @Override
    @Transactional(readOnly = true)//只读事务
    public Brand getBrandById(Integer id) {
        Brand brand = brandMapper.selectByPrimaryKey(id);
        return brand;
    }


    /**
     * 修改品牌
     *
     * @param brand
     */
    @Override
    public void modfyBrand(Brand brand) {
        //修改品牌
        brandMapper.updateByPrimaryKeySelective(brand);
    }

    /**
     * 添加品牌
     *
     * @param brand
     */
    @Override
    public void addBrand(Brand brand) {
        //创建添加时间
        Date date = new Date();
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String addDataTim = simpleDateFormat.format(date);
        brand.setBrandAddtime(addDataTim);
        brandMapper.insertSelective(brand);
    }

}
