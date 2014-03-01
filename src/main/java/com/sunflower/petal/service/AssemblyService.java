package com.sunflower.petal.service;

import com.sunflower.petal.dao.AssemblyItemDao;
import com.sunflower.petal.dao.AssemblyRuleDao;
import com.sunflower.petal.entity.AssemblyItem;
import com.sunflower.petal.entity.AssemblyRule;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by xiangkui on 14-2-22.
 */
@Service
public class AssemblyService {
    @Autowired
    private AssemblyRuleDao ruleDao;
    @Autowired
    private AssemblyItemDao itemDao;

    /**
     * rule 中的material需要关联上
     * @param rule
     */
    @Transactional
    public void addOneRule(AssemblyRule rule){
        if(rule.getId()==null){
            rule.setId(System.currentTimeMillis());
        }
        Long ruleId=rule.getId();
        ruleDao.add(rule);
        for (AssemblyItem item : rule.getItems()) {
            item.setRuleId(ruleId);
            if(item.getMaterial()!=null && item.getMaterial().getId()!=null)
            itemDao.add(item);
        }

    }
}
