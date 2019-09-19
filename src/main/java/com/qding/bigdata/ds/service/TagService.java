package com.qding.bigdata.ds.service;

import java.util.Collection;
import java.util.List;

import com.qding.bigdata.ds.model.Tag;

public interface TagService extends BaseService<Tag> {

	Tag getByTagName(String tagName);

	List<Tag> sortToTree(List<Tag> list);

	List<Tag> listByTags(Collection<String> tags);

}
