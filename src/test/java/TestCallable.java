import com.qding.bigdata.ds.datatransform.model.ConfigValueModel;

import java.util.concurrent.Callable;

/**
 * Created by lzs on 2018/6/4.
 */
public class TestCallable implements Callable<Integer> {

    private String tableName;
    private ConfigValueModel targetConfigValueModel;
    private ConfigValueModel metaConfigValueModel;
    private String districtField;
    private int i;
    @Override
    public Integer call() throws Exception {
        Runb runb=new Runb();

        return  runb.dd();
    }
}
