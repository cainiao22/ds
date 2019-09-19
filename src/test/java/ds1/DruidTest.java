package ds1;

import com.alibaba.druid.sql.SQLUtils;
import com.alibaba.druid.sql.ast.SQLStatement;
import com.alibaba.druid.sql.ast.expr.SQLAggregateExpr;
import com.alibaba.druid.sql.ast.expr.SQLAllColumnExpr;
import com.alibaba.druid.sql.ast.statement.SQLSelectItem;
import com.alibaba.druid.sql.ast.statement.SQLSelectQuery;
import com.alibaba.druid.sql.ast.statement.SQLSelectStatement;
import com.alibaba.druid.sql.dialect.postgresql.ast.stmt.PGSelectQueryBlock;
import com.alibaba.druid.sql.dialect.postgresql.visitor.PGOutputVisitor;
import com.alibaba.druid.util.JdbcConstants;

import java.util.List;

/**
 * @author yanpf
 * @date 2018/2/1 17:27
 * @description
 */
public class DruidTest {

    public static void main(String[] args) {

        String sql = "select project_id \"projectID\", project_name \"projectNM\", max(person_number) \"houseNum\", max(total_inc) \"totalReg\", round(case when coalesce(max(person_number),0)>0 then sum(current_inc)/(max(person_number)+0.00)else 0 end,2) \"permeRate\", max(total_bind_member) \"totalBinMem\", max(total_bind_room) \"totalBinHouse\", round(case when coalesce(max(person_number),0)>0 then sum(current_bind_room)/(max(person_number)+0.00)else 0 end,2) \"bindRate\", round(avg(current_act_mem),2) \"DAU\", round(case when coalesce(max(total_inc),0)>0 then sum(current_act_mem/(total_inc+0.00))/(To_date('2018-02-04' , 'yyyy-mm-dd') - To_date('2018-02-04' , 'yyyy-mm-dd')+1) else 0 end,2) \"DAURate\" from dwp.dwp_daily_shequ_data where dt between '2018-02-04' and '2018-02-04' and project_id in (6161125697621074,6161027652181364) group by project_id,project_name order by project_name";
        String dbType = JdbcConstants.POSTGRESQL;

        String format = SQLUtils.format(sql, dbType);
        List<SQLStatement> sqlStatements =
                SQLUtils.parseStatements(format, dbType);
        for (SQLStatement statement : sqlStatements) {
            StringBuilder sb = new StringBuilder();
            PGOutputVisitor visitor = new PGOutputVisitor(sb);
            SQLSelectStatement real = (SQLSelectStatement)statement;
            SQLSelectQuery selectQuery = real.getSelect().getQuery();
            PGSelectQueryBlock block = (PGSelectQueryBlock) selectQuery;
            block.setOrderBy(null);
            block.setLimit(null);
            block.setOffset(null);
            SQLAggregateExpr countItem = new SQLAggregateExpr("COUNT");
            countItem.getArguments().add(new SQLAllColumnExpr());
            block.getSelectList().clear();
            block.getSelectList().add(new SQLSelectItem(countItem));
            real.getSelect().setQuery(block);
            real.accept(visitor);

            //System.out.println(sb.toString());
            String result = sb.toString();

            if(block.getGroupBy() == null){
                System.out.println(result);
            }else{
                System.out.println("select count(*) from (" + result + ")");
            }
            //String sub = result.substring(result.indexOf("\n"), result.lastIndexOf("LIMIT") - 1);
            //System.out.println(result);

        }


    }
}
