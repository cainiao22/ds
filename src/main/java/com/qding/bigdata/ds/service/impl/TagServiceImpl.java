package com.qding.bigdata.ds.service.impl;

import java.util.ArrayList;
import java.util.Collection;
import java.util.LinkedHashMap;
import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.qding.bigdata.ds.dao.BaseDao;
import com.qding.bigdata.ds.dao.TagDao;
import com.qding.bigdata.ds.model.Tag;
import com.qding.bigdata.ds.service.TagService;

@Service
public class TagServiceImpl extends BaseServiceImpl<Tag> implements TagService {

	@Autowired
	private TagDao tagDao;

	@Override
	public BaseDao<Tag> getDao() {
		return tagDao;
	}

	@Override
	public void save(Tag t) {
		setLevel(t);
		super.save(t);
	}

	@Override
	public void update(Tag t) {
		setLevel(t);
		super.update(t);
	}

	@Override
	public Tag getByTagName(String tagName) {
		Tag q = new Tag();
		q.setTag(tagName);
		List<Tag> list = this.list(q);
		if (!list.isEmpty()) {
			return list.get(0);
		}
		return new Tag();
	}
	private void setLevel(Tag tag) {
	    String pid = tag.getPid();
	    if (pid.equals("-1")) {
	    	tag.setLevel(1);
	    } else {

	      Tag pTag = new Tag();
	      pTag.setId(pid);
	      pTag = this.getOne(pTag);

	      tag.setLevel(pTag.getLevel() + 1);
	    }

	  }

	@Override
	public List<Tag> sortToTree(List<Tag> list) {

		LinkedHashMap<String, List<Tag>> subNodeMap = new LinkedHashMap<String, List<Tag>>();

		for (Tag tag : list) {
			String pid = tag.getPid();
			if (!subNodeMap.containsKey(pid)) {
				subNodeMap.put(pid, new ArrayList<Tag>());
			}
			subNodeMap.get(pid).add(tag);
		}

		List<Tag> newList = new ArrayList<Tag>();
		Tag rootModule = new Tag();
		rootModule.setId("-1");
		putAllSubTags(subNodeMap, rootModule, newList);
		return newList;

	}

	@Override
	public List<Tag> listByTags(Collection<String> tags) {
		if (tags == null || tags.isEmpty()) {
			return new ArrayList<Tag>();
		}
		return tagDao.listByTags("'"+StringUtils.join(tags, "','")+"'");
	}

	private void putAllSubTags(LinkedHashMap<String, List<Tag>> subNodeMap, Tag tag, List<Tag> newList) {

		List<Tag> subTagList = subNodeMap.get(tag.getId());
		if (subTagList == null) {
			return;
		}
		for (Tag curTag : subTagList) {
			newList.add(curTag);
			if (subNodeMap.containsKey(curTag.getId())) {
				putAllSubTags(subNodeMap, curTag, newList);
			}
		}

	}

	@Override
	public List<Tag> list(Tag t) {
		if(StringUtils.isEmpty(t.getSortAndDesc())){
			t.setSortAndDesc("level asc,sortno asc");
		}
		return this.getDao().list(t);
	}
	
	
}
