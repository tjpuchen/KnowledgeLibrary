package com.lib.service.user;

import java.util.List;

import com.lib.dto.FileInfoVO;
import com.lib.entity.FileInfo;
import com.lib.entity.UserInfo;
/**
 * 用户处理文件上传和转化
 * @author Yu Yufeng
 *
 */
public interface FileInfoService {
	/**
	 * 插入一个新的文件信息到数据库
	 * 
	 * @param fileInfo
	 * @return
	 */
	int insertFile(FileInfo fileInfo);

	/**
	 * 解压用户上传的文件，并保存到磁盘和数据库
	 * 
	 * @param string
	 * @param user
	 * @return 解压之后的文件uuid
	 */
	List<String> compressFile(String string, UserInfo user) throws Exception;


	/**
	 * 转化一个文件
	 * @param uuid
	 */
	void translateFile(String uuid);

	/**
	 * 根据uuid查找一个文件
	 * @param uuid
	 * @return
	 */
	FileInfoVO getFileInfoByUuid(String uuid);
	/**
	 * 根据fileId查找一个文件
	 * @param uuid
	 * @return
	 */
	FileInfo getFileInfoByFileId(Long fileId);
	/**
	 * 根据uuid保存一个文件的基本信息
	 * @param uuid
	 * @return
	 */
	int saveBaseFileInfoByUuid(FileInfo fileInfo);
}
