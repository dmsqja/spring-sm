package edu.sm.app.service;

import edu.sm.app.dto.ItemDto;
import edu.sm.app.frame.SMService;
import edu.sm.app.repository.ItemRepository;
import edu.sm.util.FileUploadUtil;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class ItemService implements SMService<Integer, ItemDto> {

    final ItemRepository itemRepository;

    @Value("${app.dir.uploadimgdir}")
    String imgdir;

    @Override
    public void add(ItemDto itemDto) throws Exception {
        FileUploadUtil.saveFile(itemDto.getImage(),imgdir);
        itemRepository.insert(itemDto);
    }

    @Override
    public void modify(ItemDto itemDto) throws Exception {
        if(itemDto.getImage().isEmpty()){
            itemRepository.update(itemDto);
        }else{
            String oldimg = itemDto.getImgName();
            itemDto.setImgName(itemDto.getImage().getOriginalFilename());
            itemRepository.update(itemDto);

            FileUploadUtil.saveFile(itemDto.getImage(),imgdir);
            FileUploadUtil.deleteFile(oldimg,imgdir);
        }
    }

    @Override
    public void del(Integer key) throws Exception {
        String imgname = itemRepository.selectOne(key).getItemName();
        FileUploadUtil.deleteFile(imgname,imgdir);
        itemRepository.delete(key);
    }

    @Override
    public ItemDto get(Integer key) throws Exception {
        return itemRepository.selectOne(key);
    }

    @Override
    public List<ItemDto> get() throws Exception {
        return itemRepository.select();
    }

    public List<ItemDto> findByName(String name) throws Exception {
        return itemRepository.findByName(name);
    }
}