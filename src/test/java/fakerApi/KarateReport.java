package fakerApi;

import com.intuit.karate.Results;
import com.intuit.karate.Runner;
import net.masterthought.cucumber.Configuration;
import net.masterthought.cucumber.ReportBuilder;
import org.apache.commons.io.FileUtils;

import java.io.File;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

public class KarateReport {

    public static void generateReport(String karateOutputPath) {
        File reportOutputDirectory = new File("target/cucumber-html-reports");
        Collection<File> jsonFiles = FileUtils.listFiles(
                new File(karateOutputPath), new String[]{"json"}, true);

        if (jsonFiles.isEmpty()) {
            System.out.println("❌ JSON dosyası bulunamadı. Testler gerçekten çalıştı mı?");
        } else {
            List<String> jsonPaths = new ArrayList<>();
            for (File file : jsonFiles) {
                jsonPaths.add(file.getAbsolutePath());
            }

            Configuration config = new Configuration(reportOutputDirectory, "Karate Test Results");
            ReportBuilder reportBuilder = new ReportBuilder(jsonPaths, config);
            reportBuilder.generateReports();

            System.out.println("✅ Rapor başarıyla oluşturuldu: " + reportOutputDirectory.getAbsolutePath());
        }
    }

    public static void main(String[] args) {
        Results results = Runner.path("classpath:fakerApi")
                .tags("@faApi")
                .outputCucumberJson(true)
                .parallel(1); // paralel çalıştırma

        generateReport(results.getReportDir());

        if (results.getFailCount() > 0) {
            System.out.println("❌ Bazı testler başarısız oldu.");
            System.exit(1);
        }
    }
}
